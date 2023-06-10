require 'rails_helper'

describe 'Usuário clica no galpão' do
  it 'e vê informações do galpão' do
    # Arrange
    user = User.create!(email: 'eduardo@gmail.com', password: 'password123')
    warehouse = Warehouse.create(name: 'Aéroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
                                 address: 'Avenida do aéroporto, 1000', cep: '15000-000',
                                 description: 'Galpão destinado para cargas internacionais')
    # Act
    login_as(user)
    visit '/'
    click_on 'Aéroporto SP'

    # Assert
    expect(page).to have_content('Galpão GRU')
    expect(page).to have_content('Nome: Aéroporto SP')
    expect(page).to have_content('Cidade: Guarulhos')
    expect(page).to have_content('Área: 100000 m²')
    expect(page).to have_content('Endereço: Avenida do aéroporto, 1000 CEP: 15000-000')
    expect(page).to have_content('Galpão destinado para cargas internacionais')
  end
  it 'e volta para a tela inicial' do
    user = User.create!(email: 'eduardo@gmail.com', password: 'password123')
    warehouse = Warehouse.create(name: 'Aéroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
                                 address: 'Avenida do aéroporto, 1000', cep: '15000-000',
                                 description: 'Galpão destinado para cargas internacionais')

    login_as(user)
    visit('/')
    click_on 'Aéroporto SP'
    click_on 'Voltar'

    expect(current_path).to eq root_path
  end
end
