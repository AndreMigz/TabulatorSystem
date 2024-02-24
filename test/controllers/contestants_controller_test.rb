require "test_helper"

class ContestantsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @admin = users(:admin)
    @standard_user = users(:one)
  end

  test 'shoould be able to access the contestant index page if current user is a standard user' do
    sign_in @standard_user
    get root_path
    assert_response :success
  end

  test ' should be able to access the contestant index page if the current user is an admin' do
    sign_in @admin
    get root_path
    assert_response :success
  end

  test 'should be redirected if the ther is no logged in user' do
    sign_out @standard_user
    get root_path
    assert_response :redirect
  end
end
