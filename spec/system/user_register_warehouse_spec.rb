require 'rails_helper'

describe 'Usuário cadastra um galpão' do 
    it 'a partir da tela inicial' do
        #Arrange
        #Act
        visit root_path
        click_on 'Cadastrar Galpão'
        #Assert
        expect(page).to have_field('Nome')
        expect(page).to have_field('Código')
        expect(page).to have_field('Cidade')
        expect(page).to have_field('Área')
        expect(page).to have_field('Endereço')
        expect(page).to have_field('CEP')
        expect(page).to have_field('Descrição')

    end
    it 'com sucesso' do 

        #Arrange

        #Act
        visit root_path
        click_on 'Cadastrar Galpão'

        fill_in "Nome",	with: "Rio de Janeiro"
        fill_in "Código",	with: "RIO"
        fill_in "Cidade",	with: "Rio de Janeiro" 
        fill_in "Área",	with: "32000"  
        fill_in "Endereço",	with: "Av. Do Museu do amanhã, 1000"
        fill_in "CEP",	with: "20100-000" 
        fill_in "Descrição",    with: "Galpão da zona portuária do Rio." 
        click_on 'Cadastrar'    

        #Assert
        expect(current_path).to eq root_path
        expect(page).to have_content 'Rio de Janeiro'
        expect(page).to have_content 'RIO'
        expect(page).to have_content '32000 m²'
        expect(page).to have_content 'Galpão cadastrado com sucesso'

        
    end

    it 'com dados incompleto' do

        visit root_path

        click_on 'Cadastrar Galpão'

        fill_in "Nome",	with: ""
        fill_in "Código",	with: ""
        fill_in "Cidade",	with: "" 
        fill_in "Área",	with: ""  
        fill_in "Endereço",	with: ""
        fill_in "CEP",	with: "" 

        click_on 'Cadastrar'

        expect(page).to have_content 'Falha ao cadastrar'

    end
    it 'manter informações ao recarregar página após erro de cadastro' do 

        visit root_path
        click_on 'Cadastrar Galpão'

        fill_in "Nome",	with: "Rio de Janeiro"
        fill_in "Código",	with: "RIO"
        fill_in "Cidade",	with: "Rio de Janeiro" 
        fill_in "Área",	with: "32000"  
        fill_in "Endereço",	with: ""
        fill_in "CEP",	with: "" 
        fill_in "Descrição",    with: "" 

        click_on 'Cadastrar'  

        expect(page).to have_content 'Falha ao cadastrar'
    end
end