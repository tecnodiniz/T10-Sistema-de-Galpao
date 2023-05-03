require 'rails_helper'

describe 'Usuário visita tela de produtos' do 
    it 'A partir do menu' do 
        #Arrange
        supplier = Supplier.create!(corporate_name: 'Samsung Eletronicos', brand_name:'Samsung', registration_number:'0303698900181',
            full_address:'Av das Palmas, 1200',city:'Bauru',state:'SP',email:'samsung@yahoo.com.br' , cep: '12345-000')

        ProductModel.create!(name: 'TV 32', weight: 8000, width:70, height:45, depth:10, 
                        sku:'TV32-SAMSU-XPTO92', supplier: supplier)
        
        ProductModel.create!(name: 'SoundBar-7.1 Surrond', weight: 3000, width: 80, height:15, depth:15, 
            sku:'SOU71-SAMSU-NOIZ77', supplier: supplier)
        #Act
        visit root_path
        within('nav') do 
            click_on 'Produtos'
        end
        #Assert
        expect(current_path).to eq product_models_path
        expect(page).to have_content 'Modelo de produtos'
        expect(page).to have_content 'TV 32'
        expect(page).to have_content 'TV32-SAMSU-XPTO92'
        expect(page).to have_content 'Samsung'

        expect(page).to have_content 'SoundBar-7.1 Surrond'
        expect(page).to have_content 'SOU71-SAMSU-NOIZ77'
        expect(page).to have_content 'Samsung'
    end

    it 'e vê produto detalhado' do 
        #Arrange
        supplier = Supplier.create!(corporate_name: 'Samsung Eletronicos', brand_name:'Samsung', registration_number:'0303698900181',
            full_address:'Av das Palmas, 1200',city:'Bauru',state:'SP',email:'samsung@yahoo.com.br' , cep: '12345-000')

        ProductModel.create!(name: 'TV 32', weight: 8000, width:70, height:45, depth:10, 
                        sku:'TV32-SAMSU-XPTO92', supplier: supplier)
        
        ProductModel.create!(name: 'SoundBar-7.1 Surrond', weight: 3000, width: 80, height:15, depth:15, 
            sku:'SOU71-SAMSU-NOIZ77', supplier: supplier)
        #Act
        visit root_path
        within('nav') do 
            click_on 'Produtos'
        end
        #Assert
        click_on 'TV 32'

        expect(page).to have_content 'TV 32'
        expect(page).to have_content '8000g'
        expect(page).to have_content 'Largura: 70cm'
        expect(page).to have_content 'Altura: 45cm'
        expect(page).to have_content 'Profundidade: 10cm'
        expect(page).to have_content 'SKU: TV32-SAMSU-XPTO92'
        expect(page).to have_content 'Fornecedor: Samsung'
    end

end