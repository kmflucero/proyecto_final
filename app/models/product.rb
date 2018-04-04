class Product < ApplicationRecord
  has_and_belongs_to_many :inventories
  has_many :orders, dependent: :destroy
  has_many :users, through: :orders
  belongs_to :category
  mount_uploader :photo, ImageUploader

end
