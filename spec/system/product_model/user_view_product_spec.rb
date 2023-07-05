require 'rails_helper'

describe 'Usuário visita tela de produtos' do
  it 'A partir do menu' do
    user = User.create!(email: 'eduardo@gmail.com', password: 'password123')

    # Arrange
    supplier = Supplier.create!(corporate_name: 'Samsung Eletronicos', brand_name: 'Samsung', registration_number: '0303698900181',
                                full_address: 'Av das Palmas, 1200', city: 'Bauru', state: 'SP', email: 'samsung@yahoo.com.br', cep: '12345-000')

    ProductModel.create!(name: 'TV 32', weight: 8000, width: 70, height: 45, depth: 10,
                         sku: 'TV32X-S1AMS4U-XPTO92', supplier:)

    ProductModel.create!(name: 'SoundBar-7.1 Surrond', weight: 3000, width: 80, height: 15, depth: 15,
                         sku: 'SOU71-SA2MASU-NOIZ77', supplier:)
    # Act
    login_as(user)

    visit root_path

    within('nav') do
      click_on 'Produtos'
    end
    # Assert
    expect(current_path).to eq product_models_path
    expect(page).to have_content 'Modelo de produtos'
    expect(page).to have_content 'TV 32'
    expect(page).to have_content 'TV32X-S1AMS4U-XPTO92'
    expect(page).to have_content 'Samsung'

    expect(page).to have_content 'SoundBar-7.1 Surrond'
    expect(page).to have_content 'SOU71-SA2MASU-NOIZ77'
    expect(page).to have_content 'Samsung'
  end

  it 'e vê produto detalhado' do
    # Arrange
    user = User.create!(email: 'eduardo@gmail.com', password: 'password123')

    supplier = Supplier.create!(corporate_name: 'Samsung Eletronicos', brand_name: 'Samsung', registration_number: '0303698900181',
                                full_address: 'Av das Palmas, 1200', city: 'Bauru', state: 'SP', email: 'samsung@yahoo.com.br', cep: '12345-000')

    ProductModel.create!(name: 'TV 32', weight: 8000, width: 70, height: 45, depth: 10,
                         sku: 'TV32X-SA23MSU-XPTO92', supplier:)

    ProductModel.create!(name: 'SoundBar-7.1 Surrond', weight: 3000, width: 80, height: 15, depth: 15,
                         sku: 'SOU71-SAMASUX-NOIZ77', supplier:)
    # Act
    login_as(user)
    visit root_path
    within('nav') do
      click_on 'Produtos'
    end
    # Assert
    click_on 'TV 32'

    expect(page).to have_content 'TV 32'
    expect(page).to have_content '8000g'
    expect(page).to have_content 'Largura: 70cm'
    expect(page).to have_content 'Altura: 45cm'
    expect(page).to have_content 'Profundidade: 10cm'
    expect(page).to have_content 'SKU: TV32X-SA23MSU-XPTO92'
    expect(page).to have_content 'Fornecedor: Samsung'
  end
end
