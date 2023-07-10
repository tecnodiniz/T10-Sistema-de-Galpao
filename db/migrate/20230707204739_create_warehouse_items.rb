class CreateWarehouseItems < ActiveRecord::Migration[7.0]
  def change
    create_table :warehouse_items do |t|
      t.references :product_model, null: false, foreign_key: true
      t.references :warehouse, null: false, foreign_key: true
      t.integer :qtd

      t.timestamps
    end
  end
end
