require 'rails_helper'

describe "Usuário se autentica" do
    it 'com sucesso' do 
        User.create!(email:'eduardo@gmail.com', password: 'password123')
        visit root_path

        within('nav') do 
            click_on 'Entrar'
        end
        within('form') do
            fill_in "Email",	with: "eduardo@gmail.com" 
            fill_in "Password", with: "password123"


        end
        click_on 'Log in'

        expect(page).to have_link 'Sair'
        expect(page).not_to have_link 'Entrar'
    end

end
