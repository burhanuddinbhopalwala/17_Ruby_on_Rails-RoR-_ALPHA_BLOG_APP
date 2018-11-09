require("test_helper")

class CategoriesControllerTest < ActionDispatch::IntegrationTest
    
    def setup
        @category = Category.create(name: "Sports") # for show()
        @user = User.create(username: "john", email: "john@example.com", 
        password: "secret", admin: true)
    end 

    # functional test cases 
    test("should get categories index") do
        get(categories_path())
        assert_response(:success)
    end
    
    test("should get new") do
        # session[:user_id] = @user.id # Not working since rails 5
        sign_in_as(@user, "secret")
        get(new_category_path())
        assert_response(:success)
    end

    test("should get show") do
        get(category_path(@category)) # only id prior rails 5
        # GET verb automatically refers to show() method 
        assert_response(:success)
    end

    # 1: 
    test("should redirect create when admin not logged in") do
        assert_no_difference("Category.count()") do 
           post(categories_path(), params: {category: {name: "Sports"}})
        end 
        assert_redirected_to(categories_path())
    end 
end

=begin
1: Test error: if not handle in controller: 
Expected response to be a <3XX: redirect>, but was a <200: OK> 
=end       