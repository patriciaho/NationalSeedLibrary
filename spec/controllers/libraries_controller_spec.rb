require 'spec_helper'

describe LibrariesController do

  # describe "GET 'index'" do
  #   it "returns http success" do
  #     Library.stub(:all).and_return("An array of libraries")
  #     get 'index'
  #     expect(assigns(:libraries)).to eq "An array of libraries"
  #     response.should be_success
  #   end
  # end

  # describe "Gmaps4rails marker build" do
  #   it 'returns a hash of map markers' do
  #     Gmaps4rails.build_markers()
  #   end
  # end

  describe "GET 'new'" do
    it "returns http success" do
      Library.stub(:new).and_return("A new Library")
      get 'new'
      expect(assigns(:library)).to eq "A new Library"
      response.should be_success
    end
  end

  describe "GET 'create'" do
    it "returns http success" do
      Library.stub(:new).and_return("A new Library")
      get 'create'
      response.should be_success
    end
  end

  # describe "GET 'edit'" do
  #   it "returns http success" do
  #     get 'edit'
  #     response.should be_success
  #   end
  # end

  # describe "GET 'update'" do
  #   it "returns http success" do
  #     get 'update'
  #     response.should be_success
  #   end
  # end

  # describe "GET 'show'" do
  #   it "returns http success" do
  #     get 'show'
  #     response.should be_success
  #   end
  # end

  # describe "GET 'destroy'" do
  #   it "returns http success" do
  #     get 'destroy'
  #     response.should be_success
  #   end
  # end

end
