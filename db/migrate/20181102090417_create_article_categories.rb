# rails generate migration create_article_categories
class CreateArticleCategories < ActiveRecord::Migration[5.1]
  def up()
    create_table :article_categories do |t|
      t.integer :article_id
      t.integer :category_id
    end
  end

  def down()
    drop_table :article_categories 
  end
end
