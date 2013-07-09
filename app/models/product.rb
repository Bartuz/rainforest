class Product < ActiveRecord::Base
  attr_accessible :description, :name, :picture, :price

  validates :name, presence: true
end
