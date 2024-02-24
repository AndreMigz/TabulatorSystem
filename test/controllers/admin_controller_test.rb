require "test_helper"

class AdminControllerTest < ActionDispatch::IntegrationTest
  
  setup do
    @standard_user = users(:one)
  end

  test 'should not be able to access the admin dashboard path if the current user is a standard user' do
    sign_in @standard_user
    get admin_index_path
    assert_response :redirect
    assert_redirected_to root_path
  end
end
