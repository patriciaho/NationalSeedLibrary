require 'spec_helper'

describe SeedsController do

  

  describe "GET 'index'" do
    describe 'search function' do
      2.times { FactoryGirl.create :seed }
      FactoryGirl.create :seed, common_name: "Watermelon"
      it 'returns relevant record' do
        get 'index', { search: "tomato" }
        assigns(:seeds).count.should eq(2)
      end
    end

    # context 'when format is JSON' do
    # end
  end

  # describe "GET 'create'" do
  #   it "returns http success" do
  #     get 'create'
  #     response.should be_success
  #   end
  # end

  # describe "GET 'new'" do
  #   it "returns http success" do
  #     get 'new'
  #     response.should be_success
  #   end
  # end

end
