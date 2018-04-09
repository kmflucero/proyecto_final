class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   has_many :orders, dependent: :destroy
   has_many :products, through: :orders
   has_many :billings
   geocoded_by :address
   after_validation :geocode
 
   def cart
     orders.where(payed: false)
   end

end
