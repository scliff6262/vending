class InventoriesController < ApplicationController

  def destroy
    @machine = Machine.find(params[:machine_id])
    items_in_machine = Inventory
    .where(machine_id: @machine.id)
    .where(product_id: params[:id])
    items_in_machine.last.destroy
    if items_in_machine.length <= 2
      MachineMailer.product_low_email(@machine).deliver_now
    end
    redirect_to machine_path(@machine)
  end
end
