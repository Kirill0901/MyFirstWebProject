class RemoveSummaryFromPost < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :summary
  end
end
