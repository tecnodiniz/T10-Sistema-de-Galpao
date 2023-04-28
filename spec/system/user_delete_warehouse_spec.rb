require 'rails_helper'

describe "Usuario delete um galapão" do
    it 'Com sucesso' do 
        #Arrange
        Warehouse.create(name: 'Santa Catarina', code: 'SDU', city:'Rio de Janeiro',area: 60_000,
            address: 'Av Galpão do Rio, 1000',
            cep: '12000-000',
            description: 'Perto do aéroporto')
        #Act
        visit root_path

        click_on 'Santa Catarina'

        click_on 'Remover'

        #Assert

        expect(current_path).to eq root_path
        expect(page).to have_content ('Galpão removido com sucesso')
        expect(page).not_to have_content('Santa Catarina')
        expect(page).not_to have_content('SDU')

    end
    
end
