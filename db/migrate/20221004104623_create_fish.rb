class CreateFish < ActiveRecord::Migration[7.0]
  def change
    create_table :fish do |t|
      t.boolean :fins
      t.string :name
      t.integer :age

      t.timestamps
    end
  end
end
