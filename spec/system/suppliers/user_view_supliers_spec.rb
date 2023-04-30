require 'rails_helper'

describe "Usuário visita tela de Fornecedores" do
    it 'a partir do menu' do 

        visit root_path

        within('nav') do 
            click_on 'Fornecedores'
        end

        expect(current_path).to eq suppliers_path

    end

    it 'e vê fornecedores cadastrados' do 
        s_1 = Supplier.create!(corporate_name: 'ACME LTDA', brand_name:'ACME', registration_number:'44047449865',
                                full_address:'Av das Palmas, 1200',city:'Bauru',state:'SP',email:'acme@yahoo.com.br')
        s_2 = Supplier.create!(corporate_name: 'Arcos Douratos LTDA', brand_name:'Mc Donalds', registration_number:'498976725',
            full_address:'Av do Arvoreiro, 3000',city:'Atibaia',state:'SP',email:'mcdonalds@gmail.com.br')

        visit root_path

        within('nav') do 
            click_on 'Fornecedores'
        end
        expect(page).to have_content 'ACME'
        expect(page).to have_content 'Bauru'
        expect(page).to have_content 'Mc Donalds'
        expect(page).to have_content 'Atibaia'
        expect(page).not_to have_content 'Não há fornecedores cadastrado'        
    end

    it 'e não há fornecedor cadastrado' do 

        visit root_path

        within('nav') do 
            click_on 'Fornecedores'
        end

        expect(page).to have_content 'Não há fornecedores cadastrado'

    end

    it 'e vê informações detalhadas' do 
        s_1 = Supplier.create!(corporate_name: 'ACME LTDA', brand_name:'ACME', registration_number:'44047449865',
            full_address:'Av das Palmas, 1200',city:'Bauru',state:'SP',email:'acme@yahoo.com.br')
        s_2 = Supplier.create!(corporate_name: 'Arcos Douratos LTDA', brand_name:'Mc Donalds', registration_number:'498976725',
        full_address:'Av do Arvoreiro, 3000',city:'Atibaia',state:'SP',email:'mcdonalds@gmail.com.br')

        visit root_path

        within('nav') do 
        click_on 'Fornecedores'
        end

        click_on 'ACME'
        
        expect(page).to have_content 'ACME LTDA'
        expect(page).to have_content 'ACME'
        expect(page).to have_content '44047449865'
        expect(page).to have_content 'Av das Palmas, 1200'    
        expect(page).to have_content 'Bauru'   
        expect(page).to have_content 'SP'
        expect(page).to have_content 'acme@yahoo.com.br'

    end

end
