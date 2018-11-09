# rails generate migration add_password_digest_to_users
class AddPasswordDigestToUsers < ActiveRecord::Migration[5.1]
  def up()
    add_column :users, :password_digest, :string
  end

  def down()
    remove_column :users, :password_digest
  end
end
