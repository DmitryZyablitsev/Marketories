class ProductsController < ApplicationController
  before_action :load_product, only: %i[show edit update destroy]

  def index
    @products = Product.all
  end

  def show; end

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

  def edit; end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Your product successfully edited.'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path, notice: 'Your product has been deleted.'
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :specification, :price)
  end

  def load_product
    @product = Product.find(params[:id])
  end
end
