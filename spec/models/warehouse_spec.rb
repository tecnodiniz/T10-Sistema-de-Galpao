require 'rails_helper'

RSpec.describe Warehouse, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe '#valid?' do
    context 'validation' do
      it 'false when name is empty' do
        # Arrange
        warehouse = Warehouse.new(name: '', code: 'RIO', address: 'endereço',
                                  city: 'Cidade', area: 20_999, cep: '12000-000',
                                  description: 'Alguma coisa')
        # Act
        # result = warehouse.valid?

        # Assert
        expect(warehouse).not_to be_valid
      end

      it 'false when code is empty' do
        # Arrange
        warehouse = Warehouse.new(name: 'Rio de Janeiro', code: '', address: 'endereço',
                                  city: 'Cidade', area: 20_999, cep: '12000-000',
                                  description: 'Alguma coisa')
        # Act
        result = warehouse.valid?

        # Assert
        expect(result).to eq false
      end

      it 'false when address is empty' do
        # Arrange
        warehouse = Warehouse.new(name: 'Rio de Janeiro', code: 'RIO', address: '',
                                  city: 'Cidade', area: 20_999, cep: '12000-000',
                                  description: 'Alguma coisa')
        # Act
        result = warehouse.valid?

        # Assert
        expect(result).to eq false
      end
    end

    it 'false when code is already in use' do
      # Arrange
      data_1 = Warehouse.new(name: 'Rio de Janeiro', code: 'RIO', address: 'endereço',
                             city: 'Cidade', area: 20_999, cep: '12000-000',
                             description: 'Alguma coisa')

      data_2 = Warehouse.new(name: 'Maceió', code: 'RIO', address: 'endereço',
                             city: 'Cidade', area: 20_999, cep: '12000-000',
                             description: 'Alguma coisa')

      # Act
      data_1.save
      # result = data_2.valid?

      # Assert
      expect(data_2).not_to be_valid
    end
  end

  describe '#full_description' do
    it 'Exibe o nome e o código' do
      w = Warehouse.new(name: 'Galpão Cuiaba', code: 'CBA')
      result = w.full_description

      expect(result).to eq('CBA - Galpão Cuiaba')
    end
  end
end
