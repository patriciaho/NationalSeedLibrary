class SeedsController < ApplicationController
  def index
    @seeds = Seed.all
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

  private

  def seed_params
    params.require(:seed).permit(:common_name, :scientific_name, :planting_season, :description, :quantity)
  end
end
