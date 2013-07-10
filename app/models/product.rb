class Product < ActiveRecord::Base
  attr_accessible :description, :name, :picture, :price
  
  has_many :reviews

  validates_presence_of :description, :name, :picture, :price

  validates :picture, format: {with: %r{\.(png|jpg|gif)$}i, messsage: "Pic format must be png/jpg/gif!"}

  has_many :reviews
  has_many :users, though: :reviews

  def formated_price
  	sprintf("%.2f",price)
  end

end
