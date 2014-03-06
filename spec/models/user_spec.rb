require 'spec_helper'

describe User do

  before :each do
    @valid_attributes = { 
      username: 'princess'
    }
  end

  context 'user is unique' do
    it 'returns error if username is not unique' do
      user1 = User.create(@valid_attributes.merge(username: 'princess'))
      user2 = User.create(@valid_attributes.merge(username: 'princess'))
      expect(user2.valid?).to eq false
    end
  end

end