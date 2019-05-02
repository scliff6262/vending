class Machine < ApplicationRecord
  belongs_to :location
  has_many :inventories
  has_many :products, through: :inventories
end
