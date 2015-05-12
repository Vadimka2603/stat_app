class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.string :season
      t.integer :win
      t.integer :draw
      t.integer :lose
      t.integer :up
      t.integer :under
      t.integer :odd
      t.integer :even
      t.references :team, index: true

      t.timestamps null: false
    end
    add_foreign_key :stats, :teams
  end
end
