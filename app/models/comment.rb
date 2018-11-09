# 1: rails generate model Comment commenter:string body:text article:references
class Comment < ApplicationRecord
  belongs_to :article
end

=begin
2: The (:references) keyword used in the bash command is a special 
data type for models. It creates a new column on your database table 
with the provided model name appended with an article _id that can hold 
integer values. To get a better understanding, analyze the db/schema.rb 
file after running the migration
=end 