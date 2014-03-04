class SeedsController < ApplicationController
  def index
    @seeds = Seed.search(params[:search])

  end

  def create
    @seed = Seed.new(seed_params)
    if @seed.save
      redirect_to action: 'index'
    else
      flash[:error] = "Did not save"
      render 'new'
    end
  end

  def new
    @seed = Seed.new
  end

  def show
    @seed = Seed.find(params[:id])
  end


  private

  def seed_params
    params.require(:seed).permit(:common_name, :scientific_name, :planting_season, :description, :quantity, :photo)
  end
end
