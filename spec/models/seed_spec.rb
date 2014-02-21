require 'spec_helper'

describe Seed do
  before :each do
    @valid_attributes = {
      common_name: 'Tomato',
      scientific_name: 'Solanum lycopersicum',
      planting_season: 'Spring',
      description: 'The species originated in the South American Andes and its use as a food originated in Mexico, and spread throughout the world following the Spanish colonization of the Americas. Its many varieties are now widely grown, sometimes in greenhouses in cooler climates.',
      quantity: 100
    }
  end

  describe 'validations' do
    context 'species is not unique' do
      it 'returns error if species is not unique' do
        tom_one = Seed.create(@valid_attributes.merge(scientific_name: 'Solanum lycopersicum'))
        tom_two = Seed.create(@valid_attributes.merge(scientific_name: 'Solanum lycopersicum'))
        expect(tom_two.valid?).to eq false
      end
    end
  end
end
