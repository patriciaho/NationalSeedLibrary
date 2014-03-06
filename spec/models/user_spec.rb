require 'spec_helper'

describe User do

  let(:user) { FactoryGirl.build :user }
  subject{ user }

  describe 'validations' do
    context 'when attributes are valid' do
      it { should be_valid }
    end

    context 'user is not unique' do
      it 'does not persist if user is not unique' do
        user.save
        user2 = FactoryGirl.build :user, username: user.username
        user2.valid?
        expect(user2.errors[:username]).to include 'has already been taken'
      end
    end
  end

  describe 'authentication' do
    context 'user is authenticated' do
      it 'is authenticated' do
        user.save
        user.password = '123'
        expect(user.authenticate?(user.password)).to eq true
      end
    end

    context 'user is NOT authenticated' do
      it 'is NOT authenticated' do
        user.save
        user.password = '987'
        expect(user.authenticate?(user.password)).to eq false
      end
    end
  end

end