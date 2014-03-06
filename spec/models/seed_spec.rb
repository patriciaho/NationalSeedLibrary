require 'spec_helper'

describe Seed do
  let(:seed) { FactoryGirl.build :seed }
  subject{ seed }

  describe 'validations' do
    context 'when attributes are valid' do
      it { should be_valid } 
    end

    context 'species is not unique' do
      it 'does not persist if species is not unique' do
        seed.save
        seed2 = FactoryGirl.build :seed, scientific_name: seed.scientific_name
        seed2.valid?
        expect(seed2.errors[:scientific_name]).to include 'has already been taken'
      end
    end

    context 'common_name is not present' do
      it 'does not persist if common_name is not present' do
        seed = FactoryGirl.build :seed, common_name: ""
        expect(seed.valid?).to eq false
      end
    end # :)

    context 'descripton is not present' do
      it 'does not persist if descripton is not present' do
        seed = FactoryGirl.build :seed, description: ""
        expect(seed.valid?).to eq false
      end
    end

    context 'harvest_photo is not present' do
      it 'does not persist if photo is not present' do
        seed  = FactoryGirl.build :seed, harvest_photo: ""
        expect(seed.valid?).to eq false
      end
    end



  end # describe 'validation'


  
end # describe Seed do