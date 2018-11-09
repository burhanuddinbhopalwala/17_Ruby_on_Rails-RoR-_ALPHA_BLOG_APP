# rails generate migration AddUserToArticles user:references
class AddUserToArticles < ActiveRecord::Migration[5.1]
  def up
    add_reference :articles, :user, index: true, foreign_key: true
  end

  def down()
    remove_reference :users, :client, index: true, foreign_key: true
  end 
end
