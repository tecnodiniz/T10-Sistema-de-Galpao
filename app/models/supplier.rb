class Supplier < ApplicationRecord
    validates :corporate_name, :brand_name, :registration_number, :full_address, :city, :state, :email, presence: true
    validates :registration_number, length: { is: 13 }
    validates :registration_number, uniqueness: true
    validates_format_of :cep, with: /\A\d{5}-\d{3}\z/, message: "Deve estar no formato 00000-000"
end
