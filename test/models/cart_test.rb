require 'test_helper'

class CartTest < ActiveSupport::TestCase
  #Let's test unique products and duplicate products
  
  #This is a helper method
  def new_cart_with_one_product(product_name)
    cart = Cart.create
    cart.add_product(products(product_name).id)
    cart
  end

  test 'cart should create a new line item when adding a new product' do
    cart = new_cart_with_one_product(:one)
    assert_equal 1, cart.line_items.to_a.count
    # Add a new product
    cart.add_product(products(:ruby).id)
    assert_equal 2, cart.line_items.to_a.count
  end

  test 'cart should update an existing line item when adding an existing product' do
    cart = new_cart_with_one_product(:one)
    # Re-add the same product
    cart.add_product(products(:one).id)
    assert_equal 1, cart.line_items.to_a.count
  end
  
end
