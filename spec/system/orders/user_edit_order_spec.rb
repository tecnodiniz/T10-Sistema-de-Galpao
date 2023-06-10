require 'rails_helper'

feature 'Usuário edita dados de um pedido' do
  context 'com sucesso' do   
    scenario 'caso seja o responsável pelo cadastro do pedido' do
      user = User.create!(email: 'eduardo@gmail.com', password: 'password123')

      supplier = Supplier.create!(corporate_name: 'Samsung Eletronicos', brand_name: 'Samsung', registration_number: '0303698900181',
                                  full_address: 'Av das Palmas, 1200', city: 'Bauru', state: 'SP', email: 'samsung@yahoo.com.br', cep: '12345-000')
  
      warehouse = Warehouse.create!(name: 'Santa Catarina', code: 'SDU', city: 'Rio de Janeiro', area: 60_000,
                                    address: 'Av Galpão do Rio, 1000',
                                    cep: '12000-000',
                                    description: 'Perto do aéroporto')
      order = Order.create!(code: SecureRandom.alphanumeric(10), warehouse: warehouse, user: user, supplier: supplier,
                                  estimate_delivery_date: 1.days.from_now)
  
      login_as(user)
  
      visit order_path(order)
      click_on 'Editar pedido'
  
      select warehouse.name, from: 'Galpão destino'
      select supplier.corporate_name, from: 'Fornecedor'
      fill_in 'Data prevista',	with: 5.days.from_now
      click_on 'Gravar'
  
      expect(page).to have_content 'Pedido editado com sucesso'
      expect(page).to have_content 'Galpão: Santa Catarina'
      expect(page).to have_content 'Fornecedor: Samsung Eletronicos'
      expect(page).to have_content "Data prevista para entrega: #{I18n.localize(order.reload.estimate_delivery_date) }"
      expect(page).to have_content 'Usuário responsável: eduardo@gmail.com'
    end
  end
  context 'sem sucesso' do
    scenario 'caso não seja o dono do pedido' do 
      user = User.create!(email: 'eduardo@gmail.com', password: 'password123')
      user2 = User.create!(email: 'tecnodiniz@gmail.com', password: 'password123')

      supplier = Supplier.create!(corporate_name: 'Samsung Eletronicos', brand_name: 'Samsung', registration_number: '0303698900181',
                                  full_address: 'Av das Palmas, 1200', city: 'Bauru', state: 'SP', email: 'samsung@yahoo.com.br', cep: '12345-000')
  
      warehouse = Warehouse.create!(name: 'Santa Catarina', code: 'SDU', city: 'Rio de Janeiro', area: 60_000,
                                    address: 'Av Galpão do Rio, 1000',
                                    cep: '12000-000',
                                    description: 'Perto do aéroporto')
      order = Order.create!(code: SecureRandom.alphanumeric(10), warehouse: warehouse, user: user, supplier: supplier,
                                  estimate_delivery_date: 1.days.from_now)
  
      login_as(user2)
  
      visit order_path(order)

      expect(page).not_to have_content 'Editar pedido'

    end
  end
end
