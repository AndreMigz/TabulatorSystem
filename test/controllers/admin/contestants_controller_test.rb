require "test_helper"

class Admin::ContestantsControllerTest < ActionDispatch::IntegrationTest
 
  setup do
    @admin = users(:admin)
    @standard_user = users(:two)
    @contestant = contestants(:one)
  end

  test 'should be able to access the contestant index page on admin dashboard if current user is an admin' do
    sign_in @admin
    get admin_contestants_url
    assert_response :success
  end

  test 'should not be able to access the contestant index page on the admin dashboard if the current user is not an admin' do
    sign_in @standard_user
    get admin_contestants_url
    assert_response :redirect
    assert_redirected_to root_path
  end

  test 'should be able to create contestant' do
    sign_in @admin
    assert_difference('Contestant.count') do
      post admin_contestants_path, params: 
      { 
        contestant: 
        { 
          first_name: 'Tester',
          middle_name: 'MyString',
          last_name: 'Test',
          age: 24,
          address: 'MyString',
          user_id: @admin.id
        } 
      }
    end

    assert_redirected_to admin_contestants_path
  end

  test 'should be able to update a contestant data' do
    sign_in @admin
    patch admin_contestant_path(@contestant), params: { contestant: { first_name: 'Tester', last_name: 'Test' } }
    @contestant.reload
    assert_equal 'Tester', @contestant.first_name
    assert_equal 'Test', @contestant.last_name
    assert_redirected_to admin_contestants_url
  end

  test 'should be able to delete a contestant' do
    sign_in @admin
    assert_difference('Contestant.count', -1) do
      delete admin_contestant_path(@contestant), params: { id: @contestant.id }
    end
    assert_redirected_to admin_contestants_url
  end
end
