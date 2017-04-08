require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest

  #test create a new category
  test "get new category form and create category" do
    #get the category path to save the category
    get new_category_path
    #call the new form to get the data
    assert_template 'categories/new'
    #check if a difference in the table is 1 after save the new category
    assert_difference 'Category.count', 1 do
      #save the category
      post_via_redirect categories_path, category: {name: "sports"}
    end
    #show index page for categories
    assert_template 'categories/index'
    #check if there is a sports in the response means that the case success
    assert_match "sports", response.body
  end
end