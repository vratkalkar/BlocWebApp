class Comment < ActiveRecord::Base
  belongs_to :post
  attr_accessible :body


  validates :body, length: {minimum: 5}, presence: true
end
