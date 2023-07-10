require 'rails_helper'

describe "Usuário acessa página de pedidos" do
  it 'e vê seus pedidos' do
    user = User.create!(email: 'eduardo@example.com', password: 'password')
    user2 = User.create!(email: 'diniz@example.com', password: 'password')
    supplier = Supplier.create!(corporate_name: 'Samsung Eletronicos', brand_name: 'Samsung', registration_number: '0303698900181',
      full_address: 'Av das Palmas, 1200', city: 'Bauru', state: 'SP', email: 'samsung@yahoo.com.br', cep: '12345-000')

    warehouse = Warehouse.create!(name: 'Santa Catarina', code: 'SDU', city: 'Rio de Janeiro', area: 60_000,
            address: 'Av Galpão do Rio, 1000',
            cep: '12000-000',
            description: 'Perto do aéroporto')
    order2 = Order.create!(warehouse: warehouse, user: user2, supplier: supplier,
      estimate_delivery_date: 1.days.from_now)
    order = Order.create!(warehouse: warehouse, user: user, supplier: supplier,
          estimate_delivery_date: 1.days.from_now)

    login_as user

    visit root_path
    click_on "Meus Pedidos"
    

    expect(page).to have_content "Código: #{order.code}"
    expect(page).to have_content 'Galpão: Santa Catarina'
    expect(page).to have_content 'Usuário responsável: eduardo@example.com'
    expect(page).to have_content "Data prevista para entrega: #{order.estimate_delivery_date}"
    expect(page).to have_content 'Satus: pending'

    expect(page).not_to have_content "Código: #{order2.code}"
    expect(page).not_to have_content 'Usuário responsável: diniz@example.com'
      
  end
  it 'e vê itens do pedido' do
    user = User.create!(email: 'eduardo@example.com', password: 'password')
    user2 = User.create!(email: 'diniz@example.com', password: 'password')
    supplier = Supplier.create!(corporate_name: 'Samsung Eletronicos', brand_name: 'Samsung', registration_number: '0303698900181',
      full_address: 'Av das Palmas, 1200', city: 'Bauru', state: 'SP', email: 'samsung@yahoo.com.br', cep: '12345-000')

    produto_a = ProductModel.create!(name: 'TV 32', weight: 8000, width: 70, height: 45, depth: 10,
      sku: 'TV32X-S1AMS4U-XPTO92', supplier:)

    produto_b = ProductModel.create!(name: 'SoundBar-7.1 Surrond', weight: 3000, width: 80, height: 15, depth: 15,
            sku: 'SOU71-SA2MASU-NOIZ77', supplier:)
    produto_c = ProductModel.create!(name: 'Produto C', weight: 3000, width: 80, height: 15, depth: 15,
      sku: 'SOU71-SA2MASU-NOIZ74', supplier:)

    warehouse = Warehouse.create!(name: 'Santa Catarina', code: 'SDU', city: 'Rio de Janeiro', area: 60_000,
            address: 'Av Galpão do Rio, 1000',
            cep: '12000-000',
            description: 'Perto do aéroporto')

    order = Order.create!(warehouse: warehouse, user: user, supplier: supplier,
          estimate_delivery_date: 1.days.from_now)
    order2 = Order.create!(warehouse: warehouse, user: user2, supplier: supplier,
      estimate_delivery_date: 1.days.from_now)

    OrderItem.create(order:order, product_model:produto_a, qtd: 20)
    OrderItem.create(order:order, product_model:produto_b, qtd: 10)
    OrderItem.create(order:order2, product_model:produto_c, qtd: 10)

    login_as user

    visit root_path
    click_on 'Meus Pedidos'
    click_on order.code

    expect(page).to have_content 'Itens do pedido'
    expect(page).to have_content '20 x TV 32'
    expect(page).to have_content '10 x SoundBar-7.1 Surrond'
    expect(page).not_to have_content '10 x Produto C'
    

  end

  
end
