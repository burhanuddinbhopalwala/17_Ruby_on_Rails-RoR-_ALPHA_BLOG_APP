# 1: rails generate controller Comments
class CommentsController < ApplicationController
    http_basic_authenticate_with(name: "admin", password: "secret", 
    only: :destroy)

    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params()) # 2:
        redirect_to(article_path(@article)) # Calls the show action of the ArticlesController
    end
     
    def destroy
        @article = Article.find(params[:article_id])
        @comments = @article.comments.find(params[:id])
        @comments.destroy()
        redirect_to article_path(@article)
    end

    private
        def comment_params()
          params.require(:comment).permit(:commenter, :body)
        end
end

=begin
2: The code takes advantage of some of the methods available for 
an association. We use the create method on @article.comments to 
create and save the comment. This will automatically link the 
comment so that it belongs to that particular article
=end 