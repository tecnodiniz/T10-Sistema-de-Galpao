class WarehouseItem < ApplicationRecord
  belongs_to :product_model
  belongs_to :warehouse
end
