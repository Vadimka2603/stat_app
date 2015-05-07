class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.integer :win
      t.integer :lose
      t.integer :draw
      t.integer :up
      t.integer :down
      t.integer :odd
      t.integer :even
      t.string  :season
      t.integer :team_id
      

      t.timestamps null: false
    end
  end
end
