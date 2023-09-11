class CreateRatings < ActiveRecord::Migration[7.0]
  def change
    create_table :ratings do |t|
      t.integer :talent
      t.integer :jeans_wear
      t.integer :sports_wear
      t.integer :prelim_qa

      t.timestamps
    end
  end
end
