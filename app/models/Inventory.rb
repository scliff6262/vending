class Inventory < ApplicationRecord
  belongs_to :product
  belongs_to :machine
  validate :product_quantity_cannot_exceed_its_limit
  validate :machine_cannot_have_over_six_different_products

  def product_quantity_cannot_exceed_its_limit
    limit = self.product.limit
    quantity = self.class.where(product_id: self.product.id).where(machine_id: self.machine.id).length
    if quantity >= limit
      errors.add(:product, "has reached its limit")
    end
  end

  def machine_cannot_have_over_six_different_products
    if self.machine.slots_filled? && !self.machine.current_item_types.include?(self.product.name)
      errors.add(:machine, "can only have 6 different product types")
    end
  end
end
