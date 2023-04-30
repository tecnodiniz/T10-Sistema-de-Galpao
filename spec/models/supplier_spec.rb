require 'rails_helper'

RSpec.describe Supplier, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe '#valid?' do
    context 'validation' do 

      it 'falso quando corporate_name for estiver em branco' do 
        supplier = Supplier.new(corporate_name: '', brand_name:'ACME', registration_number:'44047449865',
          full_address:'Av das Palmas, 1200',city:'Bauru',state:'SP',email:'acme@yahoo.com.br')

          expect(supplier).not_to be_valid
      end

      it 'falso quando brand_name for estiver em branco' do 
        supplier = Supplier.new(corporate_name: 'ACME LTDA', brand_name:'', registration_number:'44047449865',
          full_address:'Av das Palmas, 1200',city:'Bauru',state:'SP',email:'acme@yahoo.com.br')

          expect(supplier).not_to be_valid
      end

      it 'falso quando registration_name for estiver em branco' do 
        supplier = Supplier.new(corporate_name: 'ACME LTDA', brand_name:'ACME', registration_number:'',
          full_address:'Av das Palmas, 1200',city:'Bauru',state:'SP',email:'acme@yahoo.com.br')

          expect(supplier).not_to be_valid
      end

      it 'falso quando full_address estiver em branco' do 
        supplier = Supplier.new(corporate_name: 'ACME LTDA', brand_name:'ACME', registration_number:'44047449865',
          full_address:'',city:'Bauru',state:'SP',email:'acme@yahoo.com.br')

          expect(supplier).not_to be_valid
      end

      it 'falso quando city estiver em branco' do 
        supplier = Supplier.new(corporate_name: 'ACME LTDA', brand_name:'ACME', registration_number:'44047449865',
          full_address:'Av das Palmas, 1200',city:'',state:'SP',email:'acme@yahoo.com.br')

          expect(supplier).not_to be_valid
      end

      it 'falso quando state estiver em branco' do 
        supplier = Supplier.new(corporate_name: 'ACME LTDA', brand_name:'ACME', registration_number:'44047449865',
          full_address:'Av das Palmas, 1200',city:'Bauru',state:'',email:'acme@yahoo.com.br')

          expect(supplier).not_to be_valid
      end

      it 'falso quando email estiver em branco' do 
        supplier = Supplier.new(corporate_name: 'ACME LTDA', brand_name:'ACME', registration_number:'44047449865',
          full_address:'Av das Palmas, 1200',city:'Bauru',state:'SP',email:'')

          expect(supplier).not_to be_valid
      end
      
    end
  end 
end
