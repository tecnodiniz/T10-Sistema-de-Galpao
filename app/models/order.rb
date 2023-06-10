class Order < ApplicationRecord
  belongs_to :warehouse
  belongs_to :supplier
  belongs_to :user

  validates :user, :supplier, :warehouse, :estimate_delivery_date, :code, presence: :true
  validates :estimate_delivery_date, comparison: {greater_than_or_equal_to: Date.today}
end
