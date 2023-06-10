require 'rails_helper'

describe 'Usuario delete um galapão' do
  it 'Com sucesso' do
    # Arrange
    user = User.create!(email: 'eduardo@gmail.com', password: 'password123')
    Warehouse.create!(name: 'Santa Catarina', code: 'SDU', city: 'Rio de Janeiro', area: 60_000,
                      address: 'Av Galpão do Rio, 1000',
                      cep: '12000-000',
                      description: 'Perto do aéroporto')
    # Act
    login_as(user)
    visit root_path

    click_on 'Santa Catarina'

    click_on 'Remover'

    # Assert

    expect(current_path).to eq root_path
    expect(page).to have_content('Galpão removido com sucesso')
    expect(page).not_to have_content('Santa Catarina')
    expect(page).not_to have_content('SDU')
  end

  it 'e não apaga outros galpões' do
    # Arrange
    user = User.create!(email: 'eduardo@gmail.com', password: 'password123')
    Warehouse.create!(name: 'Santa Catarina', code: 'SDU', city: 'Rio de Janeiro', area: 60_000,
                      address: 'Av Galpão do Rio, 1000',
                      cep: '12000-000',
                      description: 'Perto do aéroporto')

    Warehouse.create!(name: 'Rio', code: 'RIO', city: 'Rio de Janeiro', area: 60_000,
                      address: 'Av Galpão do Rio, 1000',
                      cep: '12000-000',
                      description: 'Perto do aéroporto')
    # Act
    login_as(user)
    visit root_path

    click_on 'Santa Catarina'

    click_on 'Remover'

    # Assert
    expect(page).to have_content('Rio')
    expect(page).to have_content('RIO')
    expect(page).not_to have_content('Santa Catarina')
    expect(page).not_to have_content('SDU')
  end
end
