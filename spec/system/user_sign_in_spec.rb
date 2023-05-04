require 'rails_helper'

describe "Usuário se autentica" do
    it 'com sucesso' do 
        User.create!(email:'eduardo@gmail.com', password: 'password123')
        visit root_path

        within('nav') do 
            click_on 'Entrar'
        end
        within('form') do
            fill_in "E-mail",	with: "eduardo@gmail.com" 
            fill_in "Senha", with: "password123"
        end
        click_on 'Log in'

        expect(page).to have_button 'Sair'
        expect(page).not_to have_link 'Entrar'
    end

    it 'e faz logout' do 
        User.create!(email:'eduardo@gmail.com', password: 'password123')
        visit root_path

        within('nav') do 
            click_on 'Entrar'
        end
        within('form') do
            fill_in "E-mail",	with: "eduardo@gmail.com" 
            fill_in "Senha", with: "password123"
        end
        click_on 'Log in'

        within('nav') do 
            click_on 'Sair'
        end

        expect(page).to have_content 'Logout efetuado com sucesso'

    end
end
