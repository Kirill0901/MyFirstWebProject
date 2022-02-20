class DeleteCategoriesFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :categories
  end
end
