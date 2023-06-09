require 'rails_helper'

describe 'Usuário edita modelo de produto' do
  it 'com sucesso' do
    # Arrange
    user = User.create!(email: 'eduardo@gmail.com', password: 'password123')
    login_as(user)

    supplier = Supplier.create!(corporate_name: 'Samsung Eletronicos', brand_name: 'Samsung', registration_number: '0303698900181',
                                full_address: 'Av das Palmas, 1200', city: 'Bauru', state: 'SP', email: 'samsung@yahoo.com.br', cep: '12345-000')

    ProductModel.create!(name: 'TV 32', weight: 8000, width: 70, height: 45, depth: 10,
                         sku: 'TV32X-SA14MSU-XPTO92', supplier:)

    ProductModel.create!(name: 'SoundBar-7.1 Surrond', weight: 3000, width: 80, height: 15, depth: 15,
                         sku: 'SOU71-SAM2SU1-NOIZ77', supplier:)
    # Act
    visit root_path
    within('nav') do
      click_on 'Produtos'
    end
    # Assert
    click_on 'TV 32'
    click_on 'Editar produto'

    fill_in 'Nome',	with: 'TV 32 polegadas'
    fill_in 'Peso',	with: '8000'
    fill_in 'Altura',	with: '45'
    fill_in 'Largura',	with: '70'
    fill_in 'Profundidade',	with: '10'
    fill_in 'SKU',	with: 'TV32X-SA14MSU-XPTO92'

    click_on 'Enviar'

    expect(page).to have_content 'TV 32 polegadas'
    expect(page).to have_content '8000g'
    expect(page).to have_content 'Largura: 70cm'
    expect(page).to have_content 'Altura: 45cm'
    expect(page).to have_content 'Profundidade: 10cm'
    expect(page).to have_content 'SKU: TV32X-SA14MSU-XPTO92'
    expect(page).to have_content 'Fornecedor: Samsung'
  end
end
