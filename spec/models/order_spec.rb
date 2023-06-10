require 'rails_helper'

RSpec.describe Order, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe '#valid?' do
    context 'validation' do 
      it 'falso quando estimate_delivery_date está no passado' do
        user = User.create!(email: 'eduardo@gmail.com', password: 'password123')
        supplier = Supplier.create!(corporate_name: 'Samsung Eletronicos', brand_name: 'Samsung', registration_number: '0303698900181',
                                full_address: 'Av das Palmas, 1200', city: 'Bauru', state: 'SP', email: 'samsung@yahoo.com.br', cep: '12345-000')
        warehouse = Warehouse.create!(name: 'Santa Catarina', code: 'SDU', city: 'Rio de Janeiro', area: 60_000,
                                  address: 'Av Galpão do Rio, 1000',
                                  cep: '12000-000',
                                  description: 'Perto do aéroporto')
        order = Order.new(warehouse: warehouse, supplier: supplier, user: user, estimate_delivery_date: '04/11/1995')

        expect(order).not_to be_valid
      end 
      it 'falso quando código não é gerado' do 
        user = User.create!(email: 'eduardo@gmail.com', password: 'password123')
        supplier = Supplier.create!(corporate_name: 'Samsung Eletronicos', brand_name: 'Samsung', registration_number: '0303698900181',
                                full_address: 'Av das Palmas, 1200', city: 'Bauru', state: 'SP', email: 'samsung@yahoo.com.br', cep: '12345-000')
        warehouse = Warehouse.create!(name: 'Santa Catarina', code: 'SDU', city: 'Rio de Janeiro', area: 60_000,
                                  address: 'Av Galpão do Rio, 1000',
                                  cep: '12000-000',
                                  description: 'Perto do aéroporto')
        order = Order.new(warehouse: warehouse, supplier: supplier, user: user, estimate_delivery_date: '04/11/1995')

        expect(order).not_to be_valid

      end
    end
  end
end
