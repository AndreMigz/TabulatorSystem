require 'test_helper'

class RatingsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @contestant = contestants(:one)
    @rating = ratings(:one)
    @contestant_params = { rating: { talent: 30, jeans_wear: 50, sports_wear: 60, prelim_qa: 30 } }
  end

  test 'should be able to update rating' do
    sign_in users(:one)
    patch contestant_rating_path(@rating), params: @contestant_params
    @rating.reload
    assert_equal @contestant_params[:rating][:talent], @rating.talent
    assert_equal @contestant_params[:rating][:jeans_wear], @rating.jeans_wear
    assert_equal @contestant_params[:rating][:sports_wear], @rating.sports_wear
    assert_equal @contestant_params[:rating][:prelim_qa], @rating.prelim_qa
  end
end