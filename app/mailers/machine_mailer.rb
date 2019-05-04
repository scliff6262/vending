class MachineMailer < ApplicationMailer

  def product_low_email(machine)
    @machine = machine
    mail(to: 'sclifford6262@gmail.com', subject: "Product Low")
  end
end
