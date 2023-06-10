class ProductModel < ApplicationRecord
  belongs_to :supplier
  validates :name, :weight, :width, :depth, :weight, :sku, :supplier_id, presence: true
  validates :sku, uniqueness: true
  validates :width, :weight, :height, :depth, numericality: { greater_than: 0 }
  validates :sku, length: { is: 20 }
end
