class BandsController < ApplicationController
  def index
    @bands = Band.all
  end
  
  def show
    @band = Band.find(params[:id])
    if @band
      render :show
    else
      redirect_to bands_url
    end
  end
  
  def new
    @band = Band.new
  end
  
  def create
    @band = Band.new(band_params)
    if @band.save!
      redirect_to band_url(@band)
    else
      redirect_to new_band_url
    end
  end
  
  def edit
    @band = Band.find(params[:id])
    if @band
      render :edit
    else
      flash[:errors] = ["Failed to find band"]
      redirect_to bands_url
    end
  end
  
  def update
    @band = Band.find(params[:id])
    if @band.update_attributes(band_params)
      redirect_to band_url(@band)
    else
      flash[:errors] = ["Failed to update"]
      redirect_to edit_band_url(params[:id])
    end
  end
  
  private
  def band_params
    params.require(:band).permit(:name)
  end
end
