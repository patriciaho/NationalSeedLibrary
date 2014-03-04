require 'spec_helper'

describe Library do
  before :each do
    @valid_attributes = {
      name: 'Seed Library of Los Angeles',
      address: '1520 2nd Street, Santa Monica CA' 
    }
  end

  describe 'relation to seeds' do
    it 'returns foreign key for seed id' 
      pending 'check Library record for seeds'
    end
  end

  describe 'geocoder gem' do
    it 'returns latitude and longitude from an address' do
      lib = Library.create(@valid_attributes.merge(address: '1600 Pennsylvania Ave NW Washington, DC 20500'))
      expect(lib.latitude.round(2)).to eq 38.9
      expect(lib.longitude.round(2)).to eq -77.04
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