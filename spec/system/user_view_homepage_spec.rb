require 'rails_helper'

describe 'Usuario visita tela inicial' do 
    it 'e vê o nome da app' do 
        # Arrange


        # Act
        visit('/')

        # Assert
        expect(page).to have_css('h1',text:'Galpões & Estoque')

    end
    it 'e vê os galpões cadastrados' do
        # Arrange
        Warehouse.create(name: 'Rio', code: 'SDU', city:'Rio de Janeiro',area: 60_000)
        Warehouse.create(name: 'Maceio', code: 'MCZ', city:'Maceio',area: 50_000)


        # Act
        visit('/')

        # Assert
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
        
        visit ('/')
        expect(page).to have_css('p',text:'Não há galpão cadastrado')
        
    end
end