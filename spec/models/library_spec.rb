require 'spec_helper'

describe Library do
  before :each do
    @valid_attributes = {
      name: 'Seed Library of Los Angeles',
      address: '1520 2nd Street, Santa Monica CA' 
    }
  end

  describe 'relation to seeds' do
    pending 'checking relationship to seeds'
  end

  describe 'geocoder gem' do
    it 'returns latitude and longitude from an address' do
      lib = Library.create(@valid_attributes.merge(address: '1600 Pennsylvania Ave NW Washington, DC 20500'))
      expect(lib.latitude).to eq 38.8953003
      expect(lib.longitude).to eq -77.0328011
    end
  end

  describe 'validations' do
    context 'name is not present' do
      it 'returns error if name is not present' do
        lib = Library.create(@valid_attributes.merge(name: ''))
        expect(lib.valid?).to eq false
      end
    end
  end

  describe 'validations' do
    context 'address is not present' do
      it 'returns error if address is not present' do
        lib = Library.create(@valid_attributes.merge(address: ''))
        expect(lib.valid?).to eq false
      end
    end
  end
  
end