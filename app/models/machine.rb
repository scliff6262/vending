class Machine < ApplicationRecord
  belongs_to :location
  has_many :inventories
  has_many :products, through: :inventories
  validate :machine_cannot_have_over_six_different_products

  def machine_cannot_have_over_six_different_products
    if slots_filled?
      errors.add(:machine, "can only have 6 different product types")
    end
  end


  def current_item_types
    self.products.distinct.map{|p| p.name}
  end

  def total_inventory

    current_products = self.products
    current_item_types.map do |type|
      product = Product.find_by(name: type)
      inventory = {}
      inventory[type] = current_products.count{|item| item.name === type}
      inventory[:limit] = product.limit
      inventory[:id] = product.id
      inventory
    end
  end

  def slots_filled?
    current_item_types.length >= 6
  end

  def add_new_product(product_id)
    self.products << Product.find(product_id)
  end
end
