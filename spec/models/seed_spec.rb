require 'spec_helper'

describe Seed do
  let(:seed) { FactoryGirl.build :seed }
  subject{ seed }

  describe 'validations' do
    context 'when attributes are valid' do
      it { should be_valid } 
    end

    context 'species is not unique' do
      it 'returns error if species is not unique' do
        seed.save
        seed2 = FactoryGirl.build :seed, scientific_name: seed.scientific_name
        seed2.valid?
        expect(seed2.errors[:scientific_name]).to include 'has already been taken'
      end
    end

    context 'common_name is not present' do
      it 'returns error if common_name is not present' do
        seed = FactoryGirl.build :seed, common_name: ""
        expect(seed.valid?).to eq false
      end
    end # :)


  end # describe 'validation'


  
end # describe Seed do