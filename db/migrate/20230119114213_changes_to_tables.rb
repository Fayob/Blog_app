class ChangesToTables < ActiveRecord::Migration[7.0]
  def change
    change_column(:users, :bio, :text)
    change_column(:posts, :text, :text)
    change_column(:comments, :text, :text)
    rename_column :posts, :user_id, :author_id
    rename_column :comments, :user_id, :author_id
    rename_column :likes, :user_id, :author_id
  end
end
