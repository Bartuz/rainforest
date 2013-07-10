class Product < ActiveRecord::Base
  attr_accessible :description, :name, :picture, :price
  
  validates_presence_of :description, :name, :picture, :price

  validates :picture, format: {with: %r{\.(png|jpg|gif)$}i, messsage: "Pic format must be png/jpg/gif!"}

  def formated_price
  	sprintf("%.2f",price)
  end

  private

  def picture_format_is_correct

  end

end
