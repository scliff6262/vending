class Inventory < ApplicationRecord
  belongs_to :product
  belongs_to :machine
  validate :product_quantity_cannot_exceed_its_limit

  def product_quantity_cannot_exceed_its_limit
    limit = self.product.limit
    quantity = self.class.where(product_id: self.product.id).where(machine_id: self.machine.id).length
    if quantity >= limit
      errors.add(:product, "has reached its limit")
    end 
  end
end
