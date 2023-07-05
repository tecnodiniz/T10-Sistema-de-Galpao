require 'rails_helper'

describe 'Usuário busca por pedido' do
  it 'e vê campo para buscar pedido' do
    user = User.create!(email: 'eduardo@example.com', password: 'password')
    login_as user

    visit root_path 

    within('nav') do
      within('#search-order form') do
        expect(page).to have_field 'Buscar pedido'
        expect(page).to have_button 'Buscar'
      end
    end
  end

  it 'e deve estar autenticado' do

    visit root_path 
    expect(page).not_to have_field 'Buscar pedido'
    expect(page).not_to have_button 'Buscar'

  end
  it 'a partir do menu' do
    user = User.create!(email: 'eduardo@example.com', password: 'password')
    supplier = Supplier.create!(corporate_name: 'Samsung Eletronicos', brand_name: 'Samsung', registration_number: '0303698900181',
      full_address: 'Av das Palmas, 1200', city: 'Bauru', state: 'SP', email: 'samsung@yahoo.com.br', cep: '12345-000')

    warehouse = Warehouse.create!(name: 'Santa Catarina', code: 'SDU', city: 'Rio de Janeiro', area: 60_000,
            address: 'Av Galpão do Rio, 1000',
            cep: '12000-000',
            description: 'Perto do aéroporto')
    order = Order.create!(warehouse: warehouse, user: user, supplier: supplier,
          estimate_delivery_date: 1.days.from_now)


    login_as user

    visit root_path 

    fill_in 'Buscar pedido', with:"#{order.code}"
    click_on 'Buscar'

    expect(page).to have_content 'Resultado da busca:'
    expect(page).to have_content '1 pedido encontrado'
    expect(page).to have_content "Pedido: #{order.code}"

  end
  
end