require 'rails_helper'

describe "Usuário cadastra um pedido" do
    it 'com sucesso' do 
        user = User.create!(email:'eduardo@gmail.com', password: 'password123')

        supplier = Supplier.create!(corporate_name: 'Samsung Eletronicos', brand_name:'Samsung', registration_number:'0303698900181',
            full_address:'Av das Palmas, 1200',city:'Bauru',state:'SP',email:'samsung@yahoo.com.br' , cep: '12345-000')

        warehouse = Warehouse.create!(name: 'Santa Catarina', code: 'SDU', city:'Rio de Janeiro',area: 60_000,
            address: 'Av Galpão do Rio, 1000',
            cep: '12000-000',
            description: 'Perto do aéroporto')
        
        login_as(user)

        visit root_path
        click_on 'Cadastrar pedido'
        
      
        select warehouse.name, from: 'Galpão destino'
        select supplier.corporate_name, from: 'Fornecedor'
        fill_in "Data prevista",	with: '20/12/2023'
        click_on 'Gravar'
  
        
        expect(page).to have_content 'Pedido registrado com sucesso'
        expect(page).to have_content 'Galpão: Santa Catarina'
        expect(page).to have_content 'Fornecedor: Samsung Eletronicos'
        expect(page).to have_content 'Data prevista para entrega: 20/12/2023'
        expect(page).to have_content 'Usuário responsável: eduardo@gmail.com'
    end
    
end
