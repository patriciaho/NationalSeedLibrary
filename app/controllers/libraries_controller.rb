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
  end

  def update
    @library = Library.find(params[:id])
    if @library.update(library_params)
      redirect_to action: 'index'
      flash[:notice] = "Library has been updated"
    else
      render action: 'edit'
    end
  end

  def show
    @library = Library.find(params[:id])
  end

  def destroy
  end


  private

  def library_params
    params.require(:library).permit(:name, :address)
  end
end
