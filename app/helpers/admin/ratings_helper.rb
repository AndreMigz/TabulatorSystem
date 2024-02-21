module Admin::RatingsHelper

  def total_tally(contestant_id)
    tally = RatingsCalculator.calculate_total_tally(contestant_id)
    
    tally.to_f
  end
end
