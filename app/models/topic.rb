class Topic < ActiveRecord::Base
  attr_accessible :description, :name, :public 
  belongs_to :user
  has_many :posts 

end

