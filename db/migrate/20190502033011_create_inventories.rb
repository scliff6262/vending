class CreateInventories < ActiveRecord::Migration[5.2]
  def change
    create_table :inventories do |t|
      t.belongs_to :machine, index: true
      t.belongs_to :product, index: true
      t.timestamps
    end
  end
end
