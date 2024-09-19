class CartItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_cart_item!

  def create
    @cart_item = current_user.cart.cart_items.build(product: load_product )

    if @cart_item.save
      flash[:notice] = t('.success_add_in_cart')
     
    else
      # # flash[:alert] = t('.error')
      @cart_item.errors.full_messages.each do |msg|
        p "msg"
        p msg
        flash[:alert] = msg
      end
    end

    redirect_to load_product
  end

  def destroy
  end

  private

  def load_product 
    @product ||= Product.find(cart_item_params[:product_id])    
  end

  def cart_item_params
    params.require(:cart_item).permit(:product_id)
  end

  def authorize_cart_item!
    authorize(@cart_item || CartItem)
  end
end
