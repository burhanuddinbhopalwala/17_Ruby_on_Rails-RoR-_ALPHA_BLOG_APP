# rails generate migration create_users
class CreateUsers < ActiveRecord::Migration[5.1]
  def up()
    create_table :users do |t|
      t.string :username 
      t.string :email 

      t.timestamps
    end
  end

  def down() # rake db:rollback STEP=1
    drop_table :users 
  end 
end

=begin
1: Checking "users" table connection: 
- user = User.create(username: "User1", email: "user1@gmail.com")
- user.update(email: "user12@gmail.com")
- user.destroy()
=end 