require 'rails_helper'

RSpec.describe Order, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe '#valid?' do
    context 'validation' do 
      it 'data de estimativa deve ser obrigatória e futura' do
        user = User.create!(email: 'eduardo@gmail.com', password: 'password123')
        supplier = Supplier.create!(corporate_name: 'Samsung Eletronicos', brand_name: 'Samsung', registration_number: '0303698900181',
                                full_address: 'Av das Palmas, 1200', city: 'Bauru', state: 'SP', email: 'samsung@yahoo.com.br', cep: '12345-000')
        warehouse = Warehouse.create!(name: 'Santa Catarina', code: 'SDU', city: 'Rio de Janeiro', area: 60_000,
                                  address: 'Av Galpão do Rio, 1000',
                                  cep: '12000-000',
                                  description: 'Perto do aéroporto')
        order = Order.create!(warehouse: warehouse, supplier: supplier, user: user, estimate_delivery_date: 1.days.from_now)
        result = order.valid?
        expect(result).to be true
      end 
      it 'deve ter um código' do 
        user = User.create!(email: 'eduardo@gmail.com', password: 'password123')
        supplier = Supplier.create!(corporate_name: 'Samsung Eletronicos', brand_name: 'Samsung', registration_number: '0303698900181',
                                full_address: 'Av das Palmas, 1200', city: 'Bauru', state: 'SP', email: 'samsung@yahoo.com.br', cep: '12345-000')
        warehouse = Warehouse.create!(name: 'Santa Catarina', code: 'SDU', city: 'Rio de Janeiro', area: 60_000,
                                  address: 'Av Galpão do Rio, 1000',
                                  cep: '12000-000',
                                  description: 'Perto do aéroporto')
        order = Order.create!(warehouse: warehouse, supplier: supplier, user: user, estimate_delivery_date: 1.days.from_now)

        result = order.valid?
        expect(result).to be true

      end
    end
  end
end
