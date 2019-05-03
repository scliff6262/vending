class ProductsController < ApplicationController


  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    redirect_to product_path @product
  end

  def update
    @product = Product.find(params[:id])
    @product.assign_attributes(product_params)
    if @product.save
      redirect_to product_path(@product)
    else
      render "/products/edit"
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :limit)
  end

end
