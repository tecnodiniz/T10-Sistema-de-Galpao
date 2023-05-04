require 'rails_helper'

describe 'Usuario edita galpão' do
    it 'a partir da página de detalhes' do
        #Arrange
        user = User.create!(email:'eduardo@gmail.com', password: 'password123')
        warehouse = Warehouse.create!(name: 'Maceio', code: 'MCZ', city:'Maceio',area: 50_000,
                                    address: 'Rua das Alamedas, 2000',
                                    cep:'30000-000',
                                    description: 'Perto do aéroporto')
        #Act
        login_as(user)
        visit root_path
        
        click_on 'Maceio'
        click_on 'Editar'

        #Assert
        expect(page).to have_field('Nome', with:'Maceio')
        expect(page).to have_field('Código', with:'MCZ')
        expect(page).to have_field('Cidade', with:'Maceio')
        expect(page).to have_field('Área', with:'50000')
        expect(page).to have_field('Endereço', with:'Rua das Alamedas, 2000')
        expect(page).to have_field('CEP', with:'30000-000')
        expect(page).to have_field('Descrição', with:'Perto do aéroporto')

    end
    it 'e edita o campo Descrição' do 
        #Arrange
        user = User.create!(email:'eduardo@gmail.com', password: 'password123')
        warehouse = Warehouse.create!(name: 'Maceio', code: 'MCZ', city:'Maceio',area: 50_000,
            address: 'Rua das Alamedas, 2000',
            cep:'30000-000',
            description: 'Perto do aéroporto')
        #Act
        
        login_as(user)
        visit root_path

        click_on 'Maceio'
        click_on 'Editar'

        fill_in "Descrição", with: "Longe do aéroporto" 

        click_on 'Atualizar Galpão'
    #Assert
        expect(page).to have_content('Galpão atualizado')
        expect(page).to have_content('Longe do aéroporto')

    end
    it 'e falha ao não preencher campos válidos' do
         #Arrange
         user = User.create!(email:'eduardo@gmail.com', password: 'password123')
         warehouse = Warehouse.create!(name: 'Maceio', code: 'MCZ', city:'Maceio',area: 50_000,
            address: 'Rua das Alamedas, 2000',
            cep:'30000-000',
            description: 'Perto do aéroporto')
        #Act
        login_as(user)
        visit root_path

        click_on 'Maceio'
        click_on 'Editar'

        fill_in "Código", with: ''
        fill_in "Descrição", with: "Longe do aéroporto" 

        click_on 'Atualizar Galpão'
    #Assert
        expect(page).to have_content('Não foi possível atualizar')
        expect(page).to have_content('Longe do aéroporto')
    end
end