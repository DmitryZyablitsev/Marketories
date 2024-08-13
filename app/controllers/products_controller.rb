class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = User.first || User.create!(email: 'user@dev.com')

    if @product.save
      redirect_to @product, notice: 'Your product successfully created.'
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :specification, :price)
  end
end
