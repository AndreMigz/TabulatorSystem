module RatingsCalculator
  EXPOSURE = [
    "Talent",
    "Jeans Wear",
    "Sports Wear",
    "Prelim QA"    
  ]

  # Calculate the total tally and average rating for each exposure for a specific contestant
  def self.calculate_ratings_for_contestant(contestant_id)
    total_tally = {}
    average_ratings = {}

    # Initialize the total tally for each exposure to 0
    EXPOSURE.each do |exposure|
      total_tally[exposure] = 0
    end

    ratings = Rating.where(contestant_id: contestant_id)

    # Sum up the ratings for each exposure across all rating records
    ratings.each do |rating|
      EXPOSURE.each do |exposure|
        total_tally[exposure] += rating.send(exposure.downcase.tr(" ", "_"))
      end
    end

    # Calculate the average rating for each exposure
    EXPOSURE.each do |exposure|
      average_ratings[exposure] = total_tally[exposure] / ratings.count.to_f
    end

    average_ratings
  end

  # Calculate the total tally and average rating for each exposure for all contestants
  def self.calculate_ratings_for_all_contestants
    ratings_per_contestant = {}

    Contestant.all.each do |contestant|
      ratings_per_contestant[contestant.id] = calculate_ratings_for_contestant(contestant.id)
    end

    ratings_per_contestant
  end

    # Calculate the total tally for each candidate
    def self.calculate_total_tally(contestant_id)
      average_rating_per_exposure = calculate_ratings_for_contestant(contestant_id)

      total_sum = average_rating_per_exposure.values.sum

      total_tally = total_sum / EXPOSURE.count
  end
end
