require 'spec_helper'

describe Collection do
  
  let(:collection) { FactoryGirl.build :collection }
  subject{ collection }

  describe 'validations' do
    it { should respond_to(:seed) }
  end

  describe 'validations' do
    it { should respond_to(:library) }
  end

  # describe 'relation to seeds' do
  #   it 'returns seed id' do
  #     expect(collection.seed_id).to eq 1
  #   end
  # end

end
