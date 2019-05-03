class Product < ApplicationRecord
  has_many :inventories
  has_many :machines, through: :inventories
  validates :name, presence: true
  validates :price, presence: true
  validates :limit, presence: true
end
