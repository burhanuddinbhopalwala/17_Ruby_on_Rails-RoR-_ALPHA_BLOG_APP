=begin
1: rails generate model Article title:string text:text
with model, migration, tests files 

- Models in Rails use a singular name, and their corresponding 
database tables use a plural name. Rails responded by creating a 
bunch of files. For now, we're only interested in app/models/article.rb 
and db/migrate/20140120191729_create_articles.rb (different), model
and migration files important for us after model generation
=end 

class Article < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy # 4: and 5:
    has_many :article_categories 
    has_many :categories, through: :article_categories
    
    validates(:title, presence: true, length: {minimum: 5, maximum: 25})
    validates(:text, presence: true, length: {minimum: 5, maximum: 50})
    validates(:user_id, presence: true)
end

=begin
2: With that command we told Rails that we want an Article model, 
together with a title attribute of type string, and a text attribute 
of type text. Those attributes are automatically added to the articles 
table in the database and mapped to the Article model with the help
of Active Record (smart enough), NEED TO RUN THE MIGRATION THOUGH

3: Validations: There isn't much to this file - but note that the 
Article class inherits from ApplicationRecord. ApplicationRecord 
inherits from ActiveRecord::Base which supplies a great deal of 
functionality to your Rails models for free, including basic 
database CRUD (Create, Read, Update, Destroy) operations, data 
validation, as well as sophisticated search support and the 
ability to relate multiple models to one another.

- Rails includes methods to help you validate the data that you send
to models. Rails can validate a variety of conditions in a model, 
including the presence or uniqueness of columns, their format, 
and the existence of associated objects

4: These two declarations enable a good bit of automatic behavior. 
For example, if you have an instance variable @article containing 
an article, you can retrieve all the comments belonging to that 
article as an array using @article.comments

5: If you delete an article, its associated comments will also need 
to be deleted, otherwise they would simply occupy space in the db. 
Rails allows you to use the dependent option of an association to 
achieve this
=end 
