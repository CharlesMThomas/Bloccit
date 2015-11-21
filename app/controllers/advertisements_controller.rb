class AdvertisementsController < ApplicationController
  def index
    @advertisements = Advertisement.all
  end

  def show
    @advertisement = Advertisement.find(params[:id])
  end

  def new
    @advertisement = Advertisement.new
  end

  def create
    @advertisement = Advertisement.new
    @advertisement.title = params[:advertisement][:title]
    @advertisement.copy = params[:advertisement][:copy]
    @advertisement.price = params[:advertisement][:price]

    if @advertisement.save
      redirect_to @advertisement
      flash[:notice] = "Ad was saved."
    else
      flash[:error] = "There was an error saving the ad. Please try again."
      render :new
    end
  end
end
