class ChangeIndexOfUsersFromEmailToId < ActiveRecord::Migration[7.0]
  def up
    remove_index :users, :email
    add_index :users, :id
  end

  def down
    remove_index :users, :id
    add_index :users, :email
  end
end
