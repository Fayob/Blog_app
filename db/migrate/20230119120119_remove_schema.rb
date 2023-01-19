class RemoveSchema < ActiveRecord::Migration[7.0]
  def change
    drop_table :schemas
  end
end
