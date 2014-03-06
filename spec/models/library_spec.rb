require 'spec_helper'

describe Library do

  let(:library) { FactoryGirl.build :library }
  subject{ library }

  describe 'validations' do
    context 'when attributes are valid' do
      it { should be_valid } 
    end

    context 'name is not present' do
      it 'returns error if name is not present' do
        lib = FactoryGirl.build :library, name: ""
        expect(lib.valid?).to eq false
      end
    end

    context 'address is not present' do
      it 'returns error if address is not present' do
        lib = FactoryGirl.build :library, address: ""
        expect(lib.valid?).to eq false
      end
    end
  end

  describe 'relation to seeds' do
    it 'returns an array when .seeds is called on object' do
      expect(library.seeds).to eq []
    end
  end

  describe 'geocoder gem' do
    it 'returns latitude and longitude from an address' do
      library.save
      expect(library.latitude.round(2)).to eq 38.9
      expect(library.longitude.round(2)).to eq -77.04
    end
  end
  
end