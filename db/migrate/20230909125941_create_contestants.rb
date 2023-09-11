class CreateContestants < ActiveRecord::Migration[7.0]
  def change
    create_table :contestants do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.integer :age
      t.text :address

      t.timestamps
    end
  end
end
