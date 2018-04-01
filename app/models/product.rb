class Product < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_many :users, through: :orders
  belongs_to :category
  
end
