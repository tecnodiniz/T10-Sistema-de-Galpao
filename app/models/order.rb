class Order < ApplicationRecord
  belongs_to :warehouse
  belongs_to :supplier
  belongs_to :user
  has_many :order_items
  has_many :product_models, through: :order_items
 
 

  validates :user, :supplier, :warehouse, :estimate_delivery_date, presence: :true
  validates :estimate_delivery_date, comparison: {greater_than_or_equal_to: Date.today}

  before_create :generate_code

  enum status: {'pending': 0, 'delivered': 1}
  
  private
  def generate_code 
    self.code = SecureRandom.alphanumeric(10)
  end
end
