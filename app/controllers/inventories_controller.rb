class InventoriesController < ApplicationController
   skip_before_action :verify_authenticity_token

  def destroy
    @machine = Machine.find(params[:machine_id])
    items_in_machine = Inventory
    .where(machine_id: @machine.id)
    .where(product_id: params[:id])
    items_in_machine.last.destroy
    if items_in_machine.length <= 2
      MachineMailer.product_low_email(@machine).deliver_now
    end
    render json: {}, status: :ok
  end
end
