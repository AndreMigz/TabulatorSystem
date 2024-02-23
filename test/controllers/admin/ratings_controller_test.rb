require 'test_helper'

class Admin::RatingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = users(:admin)
    @standard_user = users(:one)
  end

  test 'should be able to access the ratings index page in the admin dashboard if current user is an admin' do
    sign_in @admin
    get admin_ratings_url
    assert_response :success
  end

  test 'should not be able to access the index page in admin dashboard if the current is not an admin' do
    sign_in @standard_user
    get admin_ratings_url
    assert_response :redirect
    assert_redirected_to root_path
  end
end
