class StoreController < ApplicationController
  include CurrentCart
  skip_before_action :authorize
  before_action :set_cart

  def index
    if params[:set_locale]
      redirect_to store_url(locale: params[:set_locale])
    else
      @products = Product.order(:title)
    end
    increment_counter
  end
  
  private
  def increment_counter
    if session[:counter].nil?
      session[:counter] = 0
    end
    session[:counter] += 1
    @counter = session[:counter]
  end
end
