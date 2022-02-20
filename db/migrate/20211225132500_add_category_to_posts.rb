class AddCategoryToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :categories, :string
    add_column :posts, :rating, :number
  end
end
