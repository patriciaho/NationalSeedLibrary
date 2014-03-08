require 'spec_helper'

describe LibrariesController do

  let (:library) { FactoryGirl.build :library }
  subject { library }

  let(:current_user) { FactoryGirl.create :user}
  before :each do
    controller.stub(:current_user).and_return(current_user) 
  end
  subject {current_user}

  describe "GET 'index'" do
    it "returns http success" do
      library.save
      library2 = FactoryGirl.create :library
      Library.stub(:all).and_return([library, library2])
      get 'index'
      expect(assigns(:libraries)).to eq [library, library2]
      response.should be_success
    end

    describe "Gmaps4rails marker build" do
      it 'returns a hash of map markers' do
        library.save
        library2 = FactoryGirl.create :library
        Library.stub(:all).and_return([library, library2])
        Gmaps4rails.stub(:build_markers) do |arg|
          "A hash of marker info"
        end
        get 'index'
        expect(assigns(:hash)).to eq "A hash of marker info"
      end
    end
  end

  describe "GET 'new'" do

      context "user not signed in" do
        it "does not create a new library" do
          controller.stub(:current_user).and_return(nil) 
          Library.stub(:new).and_return("A new Library")
          get 'new'
          expect(assigns(:library)).to eq nil
        end
      end

      context "user signed in" do
        it "creates a new library" do
          Library.stub(:new).and_return("A new Library")
          get 'new'
          expect(assigns(:library)).to eq "A new Library"
        end
      end

  end

  describe "POST 'create'" do
    describe 'parameters are properly set' do 
      it 'sets the library with the named parameters' do
        Library.any_instance.stub(:valid?).and_return(true)
        post 'create', {library: {name: 'My Fancy Seed Library', address: '1520 2nd Street, Santa Monica CA'}}
        expect(assigns(:library).name).to eq 'My Fancy Seed Library'
        expect(assigns(:library).address).to eq '1520 2nd Street, Santa Monica CA'
      end
    end

    context 'when library is valid' do 
      it 'redirects to libraries_path' do 
        Library.any_instance.stub(:valid?).and_return(true)
        post 'create', {library: {name: 'Generic Seed Library', address: '1520 2nd Street, Santa Monica CA'}}
        expect(assigns(:library)).to be_persisted
        expect(response).to redirect_to libraries_path
      end
    end

    context 'when library is valid' do 
      it 'redirects to libraries_path' do 
        Library.any_instance.stub(:valid?).and_return(false)
        post 'create', {library: {name: 'Generic Seed Library', address: '1520 2nd Street, Santa Monica CA'}}
        expect(assigns(:library)).not_to be_persisted
        expect(response).to render_template :new
      end
    end
  end

  describe "GET 'edit'" do
    context "user not signed in" do
      it "does not find specified library" do
        controller.stub(:current_user).and_return(nil) 
        Library.stub(:find).and_return("A Library")
        get 'edit', { id: 123}
        expect(assigns(:library)).to eq nil
      end
    end

    context "user not signed in" do
      it "Finds specified library" do
        Library.stub(:find).and_return("A Library")
        get 'edit', { id: 123}
        expect(assigns(:library)).to eq "A Library"
      end
    end
  end

  describe "PATCH 'update'" do
    context 'when library is successfully updated' do
      it 'redirects to edit_library_path(library) and assigns new attributes' do
        library.save
        patch 'update', id: library.id, library: library.attributes
        library.reload
        expect(response).to redirect_to edit_library_path(library)
      end
    end

    context 'when library is not successfully updated' do
      it 'updates new attributes)' do
        library.save
        patch 'update', id: library.id, library: {name: 'bob'}
        library.reload
        expect(assigns(:library).name).to eq 'bob'
      end
    end
  end 

  describe "GET 'show'" do
    it "Finds specified library" do
      Library.stub(:find).and_return("A Library")
      get 'edit', { id: 123 }
      expect(assigns(:library)).to eq "A Library"
    end
  end

  describe "GET 'destroy'" do
    context "user not signed in" do
      it "does not destroy specified library" do
        controller.stub(:current_user).and_return(nil)
        library.save 
        delete 'destroy', { id: library.id }
        expect(library).to be_persisted
      end
    end

    context "user signed in" do
      it "Destroys specified library" do
        library.save
        delete :destroy, { id: library.id }
        expect(Library.count).to eq 0
      end
    end
  end

end
