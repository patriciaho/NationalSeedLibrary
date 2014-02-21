require 'spec_helper'

describe Library do
  before :each do
    @valid_attributes = {
      name: 'Seed Library of Los Angeles'
    }
  end

  describe 'validations' do
    context 'name is not present' do
      it 'returns error if name is not present' do
        lib = Library.create(@valid_attributes.merge(name: ''))
        expect(lib.valid?).to eq false
      end
    end
  end

  
end