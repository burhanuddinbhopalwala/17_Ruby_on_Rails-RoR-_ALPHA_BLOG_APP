require("test_helper")

class CreateCategoriesTest < ActionDispatch::IntegrationTest

    def setup
        @user = User.create(username: "john", email: "john@example.com", 
        password: "secret", admin: true)
    end 
    
    # Integration test cases, for Buisness processes 
    test("get new category form and create category") do
        # session[:user_id] = @user.id # Not working since rails 5
        sign_in_as(@user, "secret")
        get(new_category_path())
        assert_template("categories/new") # 1:
        # After submitting the form DB difference should be 1
        assert_difference("Category.count()", 1) do
            # post_via_redirect(category_path(), ) # prior to rails 5
            post(categories_path(), params: {category: {name: "Sports"}})
            follow_redirect!()
        end  
        # After category creation 
        assert_template("categories/index")
        # For more rigrous testing
        # assert_template("layouts/_navigation")
        # assert_template("layouts/_messages")
        # assert_template("layouts/_footer")
        # assert_template("layouts/application")
        assert_match("Sports", response.body()) # At the index page
    end

    test("for invalid category creation results in faliure") do
        # session[:user_id] = @user.id # Not working since rails 5
        sign_in_as(@user, "secret")
        get(new_category_path())
        assert_template("categories/new") # 1:
        # After submitting the form DB difference should be 1
        assert_no_difference("Category.count()") do
            # post_via_redirect(category_path(), ) # prior to rails 5
            post(categories_path(), params: {category: {name: ""}})
            # follow_redirect!() # Not redirecting in case of /new
        end  
        # For invalid category redirecting to /new again
        assert_template("categories/new")
        # Searching for elements inside shared/_errors.html.erb
        assert_select("h2.panel-title") 
        assert_select("div.panel-body")
    end 
end 

=begin
1: In Rails 5 assert_template() moved to a gem, hence make an entry of
gem "rails-controller-testing" and then install using bundle install
=end  