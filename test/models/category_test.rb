# before this run this command: rake db:migrate RAILS_ENV=test
require("test_helper")

class CategoryTest < ActiveSupport::TestCase
    
    # runs before every category test
    def setup
        # on test db no need to worry rails take care for all
        @category = Category.new(name: "Sports")
    end 
    
    # unit test cases 
    test("category should be valid") do
        assert(@category.valid?()) # True
    end    

    test("name should be present") do
        @category.name = " "
        assert_not(@category.valid?()) 
        # True after validates() else False
    end

    test("name should be unique") do
        @category.save()
        category2 = Category.new(name: "Sports")
        assert_not(category2.valid?()) 
        # True after validates() else False
    end 

    test("name should not be too long") do
        @category.name = "a" * 26 # 26 a's
        assert_not(@category.valid?())
    end

    test("name should not be too short") do
        @category.name = "aa"
        assert_not(@category.valid?())
    end
end
