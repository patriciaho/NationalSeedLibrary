class LibrariesController < ApplicationController
  def index
    if params[:search].present? && Library.near(params[:search], 200).count > 0
      @libraries = Library.near(params[:search], 200, :order_by => :distance)
    elsif params[:search].present? && Library.near(params[:search], 200).count == 0
      @libraries = Library.near(params[:search], 20000, :order_by => :distance)
    else
      @libraries = Library.all
    end
    @hash = Gmaps4rails.build_markers(@libraries) do |library, marker|
      marker.lat library.latitude
      marker.lng library.longitude
      marker.infowindow library.name
    end
  end

  def new
    @library = Library.new
  end

  def create
    @library = Library.new(library_params)
    if @library.save
      redirect_to action: 'index'
    else
      flash[:error] = 'Must submit a name'
      render action: 'new'
    end
  end

  def edit
    @library = Library.find(params[:id])
    if !params[:search] || params[:search].strip.blank?
      @seeds = []
    else
      @seeds = Seed.search(params[:search])
    end
  end

  def update
    @library = Library.find(params[:id])
    @seeds = @library.seeds
    if @library.update(library_params)
      redirect_to action: 'show'
      flash[:notice] = "Library has been updated"
    else
      render action: 'edit'
    end
  end

  def show
    @library = Library.find(params[:id])
  end

  def destroy
    @library = Library.find(params[:id])
    @library.destroy
    redirect_to libraries_path
  end


  private

  def library_params
    params.require(:library).permit(:name, :address, :collections, :seeds, :seed_attributes, :collection_ids => [], :seed_ids => [])
  end
end
