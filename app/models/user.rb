class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  attr_accessible :email, :password, :password_confirmation, :remember_me , :name, :avatar
  has_many :posts
  has_many :comments
  has_many :votes, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  before_create :set_member
  mount_uploader :avatar, AvatarUploader

ROLES = %w[member moderator admin]
  def role?(base_role)
    role.nil? ? false : ROLES.index(base_role.to_s) <= ROLES.index(role)
  end

  def favorited(post)
    self.favorites.where(post_id: post.id).first
  end

  def voted(post)
    self.votes.where(post_id: post.id).first
  end

  def self.top_rated
    self.select('users.*').
      select('COUNT(DISTINCT comments.id) AS comments_count').
      select('COUNT(DISTINCT posts.id ) AS posts_count').
      select('COUNT(DISTINCT comments.id) + COUNT(DISTINCT posts.id) AS rank').
      joins(:posts).
      joins(:comments).
      group('users.id').
      order('rank DESC')
    end

  private

  def set_member
    self.role = 'member'
  end
end
