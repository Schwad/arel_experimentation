class CreateMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :members do |t|
      t.text :name
      t.references :trinket, null: false, foreign_key: true

      t.timestamps
    end
  end
end
