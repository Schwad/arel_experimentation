class TypeIsBad < ActiveRecord::Migration[7.0]
  def change
    remove_column :candies, :type
    add_column :candies, :variety, :string
  end
end
