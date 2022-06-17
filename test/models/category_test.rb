require 'test_helper'

# test-driven development
# ex. we will develop with the test file so that when we refactor or do some opti's we can recheck our application
class CategoryTest < ActiveSupport::TestCase
    def setup
        @category = Category.new(name:"Sports")
        # this method is run before every test
    end
    
    test "category should be valid " do 
        assert @category.valid?
    end
    test "name should be present" do 
        @category.name = " "
        assert_not @category.valid?
    end
    test "name should be unique" do 
        @category.save
        @category2 = Category.new(name:"Sports")
        assert_not @category2.valid?
    end
end