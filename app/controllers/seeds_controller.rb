class SeedsController < ApplicationController
  around_action :verify_logged_in, only: [:new, :edit, :create, :update, :destroy]

  def index
    @seeds = Seed.search(params[:search])

    respond_to do |format|
      format.html {}
      format.json { render json: @seeds.to_json(only: [:common_name, :scientific_name, :planting_season, :description, :quantity, :harvest_photo_file_name])}
    end
  end

  def new
    @seed = Seed.new
  end

  def show
    @seed = Seed.find(params[:id])
  end

  def edit
    @seed = Seed.find(params[:id])
    
  end

  def create
    @seed = Seed.new(seed_params)
    if @seed.save
      redirect_to edit_seed_path(@seed)
    else
      flash[:error] = "Did not save"
      render 'new'
    end
  end

  def update
    @seed = Seed.find(params[:id])
    if @seed.update(seed_params)
      redirect_to seed_path(@seed), method: :get
    else
      flash[:error] = "Did not update"
      render 'edit'
    end
  end

  def destroy
    @seed = Seed.find(params[:id])
    @seed.destroy
    redirect_to seeds_url
  end

  private

  # def set_seed
  #   @seed = Seed.find(params[:id])
  # end

  def seed_params
    params.require(:seed).permit(:common_name, :scientific_name, :planting_season, :description, :quantity, :photo,
      :harvest_photo, :harvest_photo_original_w, :harvest_photo_original_h, :harvest_photo_box_w, :harvest_photo_crop_x, :harvest_photo_crop_y, :harvest_photo_crop_w, :harvest_photo_crop_h, :harvest_photo_aspect, 
      :plant_photo, :plant_photo_original_w, :plant_photo_original_h, :plant_photo_box_w, :plant_photo_crop_x, :plant_photo_crop_y, :plant_photo_crop_w, :plant_photo_crop_h, :plant_photo_aspect, 
      :seed_photo, :seed_photo_original_w, :seed_photo_original_h, :seed_photo_box_w, :seed_photo_crop_x, :seed_photo_crop_y, :seed_photo_crop_w, :seed_photo_crop_h, :seed_photo_aspect 
    )
  end
end


