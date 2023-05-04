require 'rails_helper'

describe 'Usuário edita fornecedor' do 
    it 'a partir da tela de detalhes' do
        user = User.create!(email:'eduardo@gmail.com', password: 'password123')
        s_1 = Supplier.create!(corporate_name: 'ACME LTDA', brand_name:'ACME', registration_number:'0303698900181',
            full_address:'Av das Palmas, 1200',city:'Bauru',state:'SP',email:'acme@yahoo.com.br', cep: '12345-000')

        
        login_as(user)
        visit root_path
        within('nav') do 
            click_on 'Fornecedores'
        end
        click_on 'ACME'
        click_on 'Editar Fornecedor'

        expect(page).to have_field('Nome', with: 'ACME LTDA')
        expect(page).to have_field('Nome fantasia', with: 'ACME')
        expect(page).to have_field('Número de registro', with: '0303698900181')
        expect(page).to have_field('Endereço', with: 'Av das Palmas, 1200')
        expect(page).to have_field('Cidade', with: 'Bauru')
        expect(page).to have_field('Estado', with: 'SP')
        expect(page).to have_field('Email', with: 'acme@yahoo.com.br')        
    end

  
    it 'e edita campo email' do
        user = User.create!(email:'eduardo@gmail.com', password: 'password123')
        s_1 = Supplier.create!(corporate_name: 'ACME LTDA', brand_name:'ACME', registration_number:'0303698900181',
            full_address:'Av das Palmas, 1200',city:'Bauru',state:'SP',email:'acme@yahoo.com.br', cep: '12345-000')

        
        login_as(user)
        visit root_path
        within('nav') do 
            click_on 'Fornecedores'
        end
        click_on 'ACME'
        click_on 'Editar Fornecedor'

        fill_in "Email",	with: "acme@gmail.com.br"

        click_on 'Atualizar Fornecedor'

        expect(page).to have_content 'Dados atualizados'
        expect(page).to have_content 'acme@gmail.com.br'
    end

    it 'e falha ao atualizar' do 
        user = User.create!(email:'eduardo@gmail.com', password: 'password123')
        s_1 = Supplier.create!(corporate_name: 'ACME LTDA', brand_name:'ACME', registration_number:'0303698900181',
            full_address:'Av das Palmas, 1200',city:'Bauru',state:'SP',email:'acme@yahoo.com.br', cep: '12345-000')

        login_as(user)
        visit root_path
        within('nav') do 
            click_on 'Fornecedores'
        end
        click_on 'ACME'
        click_on 'Editar Fornecedor'

        fill_in "Email",	with: ""

        click_on 'Atualizar Fornecedor'

        expect(page).to have_content 'Falha ao atualizar'

    end

end