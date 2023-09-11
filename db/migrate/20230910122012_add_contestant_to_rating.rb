class AddContestantToRating < ActiveRecord::Migration[7.0]
  def change
    add_reference :ratings, :contestant, polymorphic: true, index:true
  end
end
