class ProductModel < ApplicationRecord
  belongs_to :supplier
  validates :name, :weight, :width, :depth, :weight, :sku, :supplier_id, presence: true
end
