class AddCepToSupplier < ActiveRecord::Migration[7.0]
  def change
    add_column :suppliers, :cep, :string
  end
end
