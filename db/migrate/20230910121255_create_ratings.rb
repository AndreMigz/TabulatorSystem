class CreateRatings < ActiveRecord::Migration[7.0]
  def change
    create_table :ratings do |t|
      t.integer :talent, default: 0
      t.integer :jeans_wear, default: 0
      t.integer :sports_wear, default: 0
      t.integer :prelim_qa, default: 0

      t.timestamps
    end
  end
end
