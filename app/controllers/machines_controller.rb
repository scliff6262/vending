class MachinesController < ApplicationController

  def new
    @location = Location.find(params[:location_id])
    @machine = @location.machines.build
  end

  def create
    @location = Location.find(params[:location_id])
    @machine = @location.machines.build
    if @machine.save
      redirect_to machine_path(@machine)
    else
      render "machines/new"
    end
  end

  def update
    @machine = Machine.find(params[:id])
    @inventory = Inventory.new(machine_id: @machine.id, product_id: params[:product][:id])
    # @machine.products << Product.find(params[:product][:id])
    if @inventory.save
      redirect_to machine_path(@machine)
    else
      render "machines/show"
    end
  end

  def show
    @inventory = Inventory.new
    @machine = Machine.find(params[:id])
  end


end
