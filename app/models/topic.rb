class Topic < ActiveRecord::Base
  attr_accessible :description, :name, :public 
  belongs_to :user
  has_many :posts, dependent: :destroy

  scope :visible_to, ->(user) { user ? scoped : where(public: true)}

end

