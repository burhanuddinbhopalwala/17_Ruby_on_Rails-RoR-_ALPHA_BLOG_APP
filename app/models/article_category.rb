class ArticleCategory < ApplicationRecord 
    belongs_to :article
    belongs_to :category
end 

=begin
1: To check this
- article = Article.last()
- category = Category.last()
- article.categories << category # No need for vice-versa now
- article.categories
- category.articles 
=end