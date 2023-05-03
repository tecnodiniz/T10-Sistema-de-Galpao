require 'rails_helper'

describe 'Usuário cadastra modelo de produto' do 
    it 'com sucesso' do 
        supplier = Supplier.create!(corporate_name: 'Samsung Eletronicos', brand_name:'Samsung', registration_number:'0303698900181',
            full_address:'Av das Palmas, 1200',city:'Bauru',state:'SP',email:'samsung@yahoo.com.br' , cep: '12345-000')

        visit root_path

        click_on 'Produtos'
        click_on 'Cadastrar novo modelo de produto'

        fill_in "Nome",	with: "TV 32" 
        fill_in "Peso",	with: "8000" 
        fill_in "Altura",	with: "45" 
        fill_in "Largura",	with: "70" 
        fill_in "Profundidade",	with: "10" 
        fill_in "SKU",	with: "TV32-S2AMS3U-X3PTO92"

        select 'Samsung', from: 'Fornecedor' 

        click_on 'Enviar'

        expect(page).to have_content 'Modelo de produto cadastrado com sucesso'
        expect(page).to have_content 'TV 32'
        expect(page).to have_content 'TV32-S2AMS3U-X3PTO92'
        expect(page).to have_content 'Samsung'

    end
    
    it 'e não preenche todos os campos' do 
        supplier = Supplier.create!(corporate_name: 'Samsung Eletronicos', brand_name:'Samsung', registration_number:'0303698900181',
            full_address:'Av das Palmas, 1200',city:'Bauru',state:'SP',email:'samsung@yahoo.com.br' , cep: '12345-000')

        visit root_path

        click_on 'Produtos'
        click_on 'Cadastrar novo modelo de produto'

        fill_in "Nome",	with: "" 
        fill_in "Peso",	with: "8000" 
        fill_in "Altura",	with: "45" 
        fill_in "Largura",	with: "70" 
        fill_in "Profundidade",	with: "10" 
        fill_in "SKU",	with: "TV32XA-SA4MSU-XPTO92"

        select 'Samsung', from: 'Fornecedor' 

        click_on 'Enviar'
        
        expect(page).to have_content 'Falha ao criar produto'

    end

end