require 'spec_helper'

describe LibrariesController do

  let (:library) { FactoryGirl.build :library }
  subject { library }

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

  describe "POST 'create'" do
    describe 'parameters are properly set' do 
      it 'sets the library with the named parameters' do
        Library.any_instance.stub(:valid?).and_return(true)
        post 'create', {library: {name: 'My Fancy Seed Library', address: '1520 2nd Street, Santa Monica CA'}}
        expect(assigns(:library).name).to eq 'My Fancy Seed Library'
      end
    end

    describe 'parameters are properly set' do 
      it 'sets the library with the named parameters' do
        Library.any_instance.stub(:valid?).and_return(true)
        post 'create', {library: {name: 'My Fancy Seed Library', address: '1520 2nd Street, Santa Monica CA'}}
        expect(assigns(:library).address).to eq '1520 2nd Street, Santa Monica CA'
      end
    end


    context 'library is valid' do
      it 'redirects to libraries_path' do
        Library.any_instance.stub(valid?).and_return(true)
        post 'create', {library: {} }
      end
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
