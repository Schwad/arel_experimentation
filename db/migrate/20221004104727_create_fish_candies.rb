class CreateFishCandies < ActiveRecord::Migration[7.0]
  def change
    create_table :fish_candies do |t|
      t.integer :fish_id
      t.integer :candy_id

      t.timestamps
    end
  end
end
