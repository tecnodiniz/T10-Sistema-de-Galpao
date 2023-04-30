require 'rails_helper'

describe 'Usuário cadastra fornecedor' do 
    it 'a partir da tela de fornecedor' do
        visit root_path

        within('nav') do 
            click_on 'Fornecedores'
        end
        
        click_on 'Cadastrar fornecedor'

        expect(page).to have_field 'Nome'
        expect(page).to have_field 'Nome fantasia'
        expect(page).to have_field 'Número de registro'
        expect(page).to have_field 'Endereço'
        expect(page).to have_field 'Cidade'
        expect(page).to have_field 'Estado'
        expect(page).to have_field 'Email'
        expect(page).to have_field 'CEP'
    end

    it 'com sucesso' do 

        visit root_path
        within('nav') do 
            click_on 'Fornecedores'
        end
        click_on 'Cadastrar fornecedor'

        fill_in 'Nome', with: 'ACME LTDA'
        fill_in 'Nome fantasia', with:'ACME'
        fill_in 'Número de registro', with:'0303698900181'
        fill_in 'Endereço', with:'Rua das Alamedas, 1200'
        fill_in 'Cidade', with:'Bauru'
        fill_in 'Estado', with:'SP'
        fill_in 'Email', with:'acme@yahoo.com.br'
        fill_in 'CEP', with:'12345-123'

        click_on 'Criar Fornecedor'

        expect(current_path).to eq suppliers_path
        expect(page).to have_content 'Fornecedor cadastrado com sucesso'
        expect(page).to have_content 'ACME'
        expect(page).to have_content 'Bauru'
    end

    it 'sem sucesso' do 

        visit root_path
        within('nav') do 
            click_on 'Fornecedores'
        end
        click_on 'Cadastrar fornecedor'

        fill_in 'Nome', with: ''
        fill_in 'Nome fantasia', with:''
        fill_in 'Número de registro', with:''
        fill_in 'Endereço', with:''
        fill_in 'Cidade', with:''
        fill_in 'Estado', with:''
        fill_in 'Email', with:''

        click_on 'Criar Fornecedor'
        
        expect(page).to have_content 'Nome não pode ficar em branco'
        expect(page).to have_content 'Nome fantasia não pode ficar em branco'
        expect(page).to have_content 'Número de registro não pode ficar em branco'
        expect(page).to have_content 'Endereço não pode ficar em branco'
        expect(page).to have_content 'Cidade não pode ficar em branco'
        expect(page).to have_content 'SP não pode ficar em branco'
        expect(page).to have_content 'Email não pode ficar em branco'
    end

    it 'com CNPJ inválido' do 

        visit root_path
        within('nav') do 
            click_on 'Fornecedores'
        end
        click_on 'Cadastrar fornecedor'

        fill_in 'Nome', with: 'ACME LTDA'
        fill_in 'Nome fantasia', with:'ACME'
        fill_in 'Número de registro', with:'0303698900181000'
        fill_in 'Endereço', with:'Rua das Alamedas, 1200'
        fill_in 'Cidade', with:'Bauru'
        fill_in 'Estado', with:'SP'
        fill_in 'Email', with:'acme@yahoo.com.br'
        fill_in 'CEP', with:'12345-000'

        click_on 'Criar Fornecedor'

        expect(page).to have_content 'Número de registro não possui o tamanho esperado (13 caracteres)'

    end

    it 'com CNPJ em já cadastrado' do 
        s_2 = Supplier.create!(corporate_name: 'Arcos Douratos LTDA', brand_name:'Mc Donalds', registration_number:'0303698900181',
            full_address:'Av do Arvoreiro, 3000',city:'Atibaia',state:'SP',email:'mcdonalds@gmail.com.br', cep:'12345-000')

        visit root_path
        within('nav') do 
            click_on 'Fornecedores'
        end
        click_on 'Cadastrar fornecedor'

        fill_in 'Nome', with: 'ACME LTDA'
        fill_in 'Nome fantasia', with:'ACME'
        fill_in 'Número de registro', with:'0303698900181'
        fill_in 'Endereço', with:'Rua das Alamedas, 1200'
        fill_in 'Cidade', with:'Bauru'
        fill_in 'Estado', with:'SP'
        fill_in 'Email', with:'acme@yahoo.com.br'
        fill_in 'CEP', with:'12345-000'

        click_on 'Criar Fornecedor'

        expect(page).to have_content 'Número de registro já está em uso'

    end

end