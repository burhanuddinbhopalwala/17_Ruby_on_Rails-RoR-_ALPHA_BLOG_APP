=begin
1: rails generate controller Articles
with controller, helper and view/s(if passed action names also)

- A controller is simply a class that is defined to inherit from 
ApplicationController. It's inside this class that you'll define 
methods that will become the actions for this controller. These 
actions will perform CRUD operations on the articles within our 
system.
=end

class ArticlesController < ApplicationController
    #http_basic_authenticate_with(name: "blog", password: "secret", 
    #except: [:index, :show]) # 2.1: 
    # 2.2 before_action should be in order
    before_action :set_article, only: [:edit, :update, :show, :destroy]
    before_action :require_user, except: [:index, :show]
    before_action :require_same_user, only: [:edit, :update, :destroy]
    
    def index 
        @articles = Article.paginate(page: params[:page], per_page: 5)
    end 
    
    def show()
        # 3: We do this because Rails will pass all instance variables to the view
        # finding article in private set_article()
    end 

    def new 
        @article = Article.new() # For preventing nil class error 
    end

    def edit 
        # finding article in private set_article()
    end 

    def create
        # 4: Completed 204 No Content in 1637ms, for empty response
        # render(plain: params[:article].inspect())
        # @article = Article.new(params[:article]) # 5: Strong parameters
        # 6: # To prevent wrongful mass assignment, use below
        @article = Article.new(article_params())
        @article.user = current_user()
        if(@article.save()) # returns boolean
            flash[:success] = "Artcile was successfully created"
            redirect_to(@article) # go to action "show", with new request
        else 
            # 7: go to action "new", with same request
            render("new")
        end  
    end 
    
    def update
        @article = Article.find(params[:id])
        # 8:
        if @article.update(article_params())
            flash[:success] = "Artcile was successfully updated"
            redirect_to(@article) # go to action "show", with new request
        else
            # 9: go to action "edit", with same request
            render("edit") 
        end
    end 

    def destroy
        # 10:
        # finding article in private set_article()
        @article.destroy()
        flash[:danger] = "Article was successfully deleted"
        redirect_to(articles_path())
    end

    private

        def set_article()
            @article = Article.find(params[:id])
            # (flash[:danger] = "Article not found" and return) if(@article.blank?())
        end
        
        def article_params()
            params.require(:article).permit(:title, :text, category_ids: [])
        end

        def require_same_user()
            if(current_user() != @article.user and !current_user().admin?())
                flash[:danger] = "You can only edit or delete your own articles"
                redirect_to(root_path())
            end 
        end 
end

=begin
2.1: Rails provides a very simple HTTP authentication system that 
will work nicely in this situation

- In the ArticlesController we need to have a way to block access 
to the various actions if the person is not authenticated. Here 
we can use the Rails http_basic_authenticate_with(), which 
allows access to the requested action if that method allows it

- To use the authentication system, we specify it at the top of 
our ArticlesController in app/controllers/articles_controller.rb. 
In our case, we want the user to be authenticated on every action
except index() and show()

5: The params() returns an ActionController::Parameters 
object, which allows you to access the keys of the hash using 
either strings or symbols. In this situation, the only parameters 
that matter are the ones from the form

6: Here's what's going on: every Rails model can be initialized 
with its respective attributes, which are automatically mapped to 
the respective database columns. In the first line we do just that
(remember that params[:article] contains the attributes we're 
interested in). Then, @article.save is responsible for saving the 
model in the database. Finally, we redirect the user to the show 
action

7: The new action is now creating a new instance variable called 
@article, and you can in new()

- IMP: Notice that inside the create action we use render instead 
of redirect_to() when save returns false. The render method is used 
so that the @article object is passed back to the new template when 
it is rendered. This rendering is done within the same request as 
the form submission, whereas the redirect_to() will tell the browser 
to issue another request
    
8: The update(), is used when you want to update a record 
that already exists, and it accepts a hash containing the attributes 
that you want to update. As before, if there was an error updating 
the article we want to show the form back to the user

10: The delete routing method should be used for routes that destroy 
resources. If this was left as a typical get route, it could be possible 
for people to craft malicious URLs like this:
<a href='http://example.com/articles/1/destroy'>look at this cat!</a>
=end 