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

  def destroy
    # binding.pry
    @machine = Machine.find(params[:machine_id])
    @product = Product.find(params[:id])
    @inventories = Inventory.where(product_id: @product.id).where(machine_id: @machine.id)
    @inventories.destroy_all
    redirect_to machine_path(@machine)
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :limit)
  end

end
