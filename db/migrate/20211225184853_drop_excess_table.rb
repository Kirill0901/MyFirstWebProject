class DropExcessTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :notes
  end
end
