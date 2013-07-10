class Product < ActiveRecord::Base
  attr_accessible :description, :name, :picture, :price

  validates_presence_of :description, :name, :picture, :price

  validates :picture, format: {with: %r{\.(png|jpg|gif)$}i, messsage: "Pic format must be png/jpg/gif!"}

  has_many :reviews
  has_many :users, through: :reviews

  def formated_price
  	sprintf("%.2f",price)
  end

end
