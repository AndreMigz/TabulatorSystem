class Admin::RatingsController < AdminController

    def index
        @contestants = Contestant.where(user_id: current_user.id)

        @total_ratings_per_exposure = RatingsCalculator.calculate_ratings_for_all_contestants
    end
end
