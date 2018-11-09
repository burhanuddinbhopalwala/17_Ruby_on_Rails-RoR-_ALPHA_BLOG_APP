# rails generate migration add_admin_to_users
class AddAdminToUsers < ActiveRecord::Migration[5.1]
  def up()
    add_column :users, :admin, :boolean, default: false 
  end

  def down()
    remove_column :users, :admin
  end
end
