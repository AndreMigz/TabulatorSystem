class AddContestantToRating < ActiveRecord::Migration[7.0]
  def change
    add_reference :ratings, :contestant, foreign_key: true, index:true
  end
end
