class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  belongs_to :user
  belongs_to :topic
  attr_accessible :body, :title, :topic, :image, :name

  mount_uploader :image, ImageUploader

  default_scope { order('created_at DESC') }
  

  validates :title, length: {minimum: 5}, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :user, presence: true
  validates :topic, presence: true

  def up_votes
    self.votes.where(value: 1).count
  end

  def down_votes
    self.votes.where(value: -1).count
  end
 
  def points
    self.votes.sum(:value).to_i
  end
end
  





