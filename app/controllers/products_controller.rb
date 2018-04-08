class ProductsController < ApplicationController
	 before_action :authenticate_user!

		def index
		
		@categories = Category.all
		if params[:buscar].present?
			consulta = params[:buscar].capitalize
			@products = Product.where('name like ?', "%#{consulta}%")
		end
	end
	def create
		@product = Product.new(product_params)
		@product.admin_user = current_admin_user
		@product.save
	end
	private 
	def product_params
		params.require(:product).permit(:name, :photo, :price, :category_id, :top)
	end
end
