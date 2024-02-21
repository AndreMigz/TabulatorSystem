module Admin::RatingsHelper

  def total_tally(contestant_id)
    RatingsCalculator.calculate_total_tally(contestant_id)
  end
end
