class RatingsController < ApplicationController
  before_action :set_contestant!
  
  def update
    if @contestant_rating.update(rating_params)
      redirect_to @contestan_rating, notice: "Ratings Added"
    else
      redirect_to @contestant_ratings, error: "Failed to add rating."
    end
  end
  
  private
  
    def rating_params
      params.require(:rating).permit(:talent, :jeans_wear, sports_wear, prelim_qa)
    end
    
    def set_contestant!
      @contestant_rating = Rating.find(params[:id])
    end
end
