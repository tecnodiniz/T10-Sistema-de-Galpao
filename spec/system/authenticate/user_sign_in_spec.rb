require 'rails_helper'

describe 'Usuário se autentica' do
  it 'com sucesso' do
    user = User.create!(email: 'eduardo@gmail.com', password: 'password123')

    login_as(user)

    visit root_path

    expect(page).to have_button 'Sair'
    expect(page).not_to have_link 'Entrar'
  end

  it 'e faz logout' do
    user = User.create!(email: 'eduardo@gmail.com', password: 'password123')

    login_as(user)

    visit root_path

    within('nav') do
      click_on 'Sair'
    end

    expect(page).to have_content 'Para continuar, faça login ou registre-se.'
  end
end
