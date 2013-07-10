class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :name

  has_secure_password

  validates_presence_of :password_digest, on: :create

  validates :name, presence: true

  has_many :reviews
  has_many :products, :through => :reviews
end
