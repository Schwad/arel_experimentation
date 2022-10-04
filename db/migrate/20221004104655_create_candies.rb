class CreateCandies < ActiveRecord::Migration[7.0]
  def change
    create_table :candies do |t|
      t.string :type
      t.integer :calories

      t.timestamps
    end
  end
end
