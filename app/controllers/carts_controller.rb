class CartsController < ApplicationController
  def show
    @cart = current_user.current_cart
  end

  def checkout
    update_inventory
    current_user.remove_cart
    redirect_to cart_path(current_user)
    # @cart = Cart.find params[:id]
    # # binding.pry
    # @current_cart = current_user.current_cart
    #   current_user.current_cart.line_items.each do |line_item|
    #     line_item.item.inventory -= line_item.quantity
    #     line_item.item.save
    #   end
    # @current_cart.status = nil
    # redirect_to cart_path(@cart)
  end


  private

  def update_inventory
    current_user.current_cart.line_items.each do |item|
      @item = Item.find(item.item_id)
      @item.inventory -= item.quantity
      @item.save
    end
  end

end
