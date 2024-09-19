class ProductsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :load_product, only: %i[show edit update destroy]
  before_action :authorize_product!
  after_action :verify_authorized

  def index
    @products = Product.all
  end

  def show; end

  def new
    @product = Product.new
  end

  def create
    @product = current_user.products.new(product_params)

    if @product.save
      redirect_to @product, notice: t('.success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: t('.success')
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path, notice: t('.success')
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :specification, :price)
  end

  def load_product
    @product = Product.find(params[:id])
  end

  def authorize_product!
    authorize(@product || Product)
  end
end
