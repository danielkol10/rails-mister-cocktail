class AddedUniqueIndexToDoses < ActiveRecord::Migration[5.2]
  def change
    add_index :doses, [:cocktail_id, :ingredient_id], unique: true
  end
end
