class InventoriesController < ApplicationController

  def destroy
    @machine = Machine.find(params[:machine_id])
    Inventory
    .where(machine_id: @machine.id)
    .where(product_id: params[:id]).last.destroy
    redirect_to machine_path(@machine)
  end
end
