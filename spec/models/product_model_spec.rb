require 'rails_helper'

RSpec.describe ProductModel, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe '#valid?' do
    context 'validation' do 

      it 'falso quando nome estiver em branco' do 
        supplier = Supplier.create!(corporate_name: 'Samsung Eletronicos', brand_name:'Samsung', registration_number:'0303698900181',
          full_address:'Av das Palmas, 1200',city:'Bauru',state:'SP',email:'samsung@yahoo.com.br' , cep: '12345-000')

          product_1 = ProductModel.new(name: '', weight: 8000, width:70, height:45, depth:10, 
                          sku:'TV3229-SAMSU2-XPTO92', supplier: supplier)
          
          product_2 = ProductModel.new(name: 'SoundBar-7.1 Surrond', weight: 3000, width: 80, height:15, depth:15, 
              sku:'SOU71-S1A2MSU-NOIZ77', supplier: supplier)
        

          expect(product_1).not_to be_valid
          expect(product_2).to be_valid
        
      end

      it 'falso quando SKU estiver em uso' do 
        supplier = Supplier.create!(corporate_name: 'Samsung Eletronicos', brand_name:'Samsung', registration_number:'0303698900181',
          full_address:'Av das Palmas, 1200',city:'Bauru',state:'SP',email:'samsung@yahoo.com.br' , cep: '12345-000')

          product_1 = ProductModel.create!(name: 'TV 32', weight: 8000, width:70, height:45, depth:10, 
                          sku:'TV3239-SA1MSU-XPTO92', supplier: supplier)
          
          product_2 = ProductModel.new(name: 'SoundBar-7.1 Surrond', weight: 3000, width: 80, height:15, depth:15, 
              sku:'TV32-SAMSU-XPTO92', supplier: supplier)
        
        
          expect(product_2).not_to be_valid
        
      end

      it 'falso quando width, height ou depth for menor ou igual a 0' do 
        supplier = Supplier.create!(corporate_name: 'Samsung Eletronicos', brand_name:'Samsung', registration_number:'0303698900181',
          full_address:'Av das Palmas, 1200',city:'Bauru',state:'SP',email:'samsung@yahoo.com.br' , cep: '12345-000')

          product_1 = ProductModel.new(name: 'TV 32', weight: 8000, width:0, height:45, depth:10, 
                          sku:'TV32-SAMSU-XPTO92', supplier: supplier)
          
          product_2 = ProductModel.new(name: 'SoundBar-7.1 Surrond', weight: 3000, width: 80, height:0, depth:15, 
              sku:'SOUND1-SURR12-XSAO92', supplier: supplier)
          
          product_3 = ProductModel.new(name: 'SoundBar-7.5 Surrond', weight: 3000, width: 80, height:10, depth:-5, 
              sku:'SOUND1-SURR12-XSAO94', supplier: supplier)
        
        
          expect(product_1).not_to be_valid
          expect(product_2).not_to be_valid
          expect(product_3).not_to be_valid
        
      end


    end
  end
end
