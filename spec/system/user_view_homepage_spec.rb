require 'rails_helper'

describe 'Usuario visita tela inicial' do 
    it 'e vê o nome da app' do 
        # Arrange


        # Act
        visit('/')

        # Assert
        expect(page).to have_content('Galpões & Estoque')

    end
    it 'e vê os galpões cadastrados' do
        # Arrange
        user = User.create!(email:'eduardo@gmail.com', password: 'password123')

        Warehouse.create(name: 'Rio', code: 'SDU', city:'Rio de Janeiro',area: 60_000,
        address: 'Av Galpão do Rio, 1000',
        cep: '12000-000',
        description: 'Perto do aéroporto')
        Warehouse.create(name: 'Maceio', code: 'MCZ', city:'Maceio',area: 50_000,
        address: 'Rua das Alamedas, 2000',
        cep:'30000-000',
        description: 'Perto do aéroporto')


        # Act
        login_as(user)
        visit('/')

        # Assert
        expect(page).not_to have_content('Não há galpão cadastrado')
        expect(page).to have_content('Rio')
        expect(page).to have_content('SDU')
        expect(page).to have_content('Rio de Janeiro')
        expect(page).to have_content('60000 m²')

        expect(page).to have_content('Maceio')
        expect(page).to have_content('MCZ')
        expect(page).to have_content('Maceio')
        expect(page).to have_content('50000 m²')
    end

    it 'e vê mensagem caso não há nenhum galpão cadastrado' do
        user = User.create!(email:'eduardo@gmail.com', password: 'password123')
        login_as(user)
        visit ('/')
        expect(page).to have_content('Não há galpão cadastrado')
        
    end
end