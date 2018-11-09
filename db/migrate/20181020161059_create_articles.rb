=begin
1: rake db:migrate 
- rails generate migration create_articles 
Migrations are Ruby classes that are designed to make it simple 
to create and modify database tables. Rails uses rake commands to 
run migrations, and it's possible to undo a migration after it's 
been applied to your database. Migration filenames include a 
timestamp to ensure that they're processed in the order that they 
were created.
=end

class CreateArticles < ActiveRecord::Migration[5.1]
  def up()
    create_table :articles do |t|
      t.string :title
      t.text :text

      t.timestamps
    end
  end

  def down() 
    drop_table :articles
  end 
end

=begin
A: MIGRATIONS/ ALITER WAY: 
1: # imporve that with up() and down() # In this case no need to create 
another db migration
2: rake db:rollback # make the corrections
3: rake db:migrate 
4: make the model and check with rails console (which loads the 
entire application in console)

B: INSERT:
1: Open rails console
2: article = Articles.new(*initialize_attributes)
3: article.attribute = "values" # Change OR initiaize seprately
4: article.save()
Note: article.new(*initialize_attributed) + article.save() = 
article.create(initialize)

C: EDIT
1: Open rails console
2: article = Articles.find(id) # Throws exception incase not found 
intead of this "find_by_id()" preferred, which returns "nil"
3: article.attribute = "new_value"
4: article.update(article_params()) # for whitelisting paramters also
known as strong parameters in rails 

D: DELETE
1: Open rails console
2: article = Articles.find(id) # Throws exception incase not found 
intead of this "find_by_id()" preferred, which returns "nil"
3: article.destroy()
4: reload!()

E: MODEL LEVEL VALIDATION (BEST PLACE FOR VALIDATIONS)
1: validates(:title, presence: true, length: {minimum: 3, maximum: 50})
2: article.save() => false # if validation fails 
3: article.errors.any?() => true
4: article.errors.full_messages() => <error_message>
=end