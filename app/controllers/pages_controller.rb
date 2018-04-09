class PagesController < ApplicationController
	 before_action :authenticate_user!

  def index
  	@products =Product.all
  end

  def about
  end

  def contact
  end
end
