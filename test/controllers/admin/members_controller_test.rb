require 'test_helper'

class Admin::MembersControllerTest < ActionDispatch::IntegrationTest
  
  setup do
    @admin_user = users(:admin)
    @member = users(:one)
  end
  
  test 'should be able to access the members index page in admin dashboard if current user is admin' do
    sign_in @admin_user
    get admin_members_url
    assert_response :success
  end

  test 'should not be able to access the members index page in the admin dashboard if the current user is a standard user' do
    sign_in @member
    get admin_members_url
    assert_response :redirect
    assert_redirected_to root_path
  end

  test 'should create member' do
    sign_in @admin_user
    assert_difference('User.count') do
      post admin_members_url, params: { user: { admin_id: @admin_user.id, email: 'test@example.com', password: 'password', password_confirmation: 'password' } }
    end
    assert_redirected_to admin_members_url
  end

  test 'should update member' do
    sign_in @admin_user
    patch admin_member_url(@member), params: { user: { email: 'new_email@example.com' } }
    @member.reload
    assert_equal 'new_email@example.com', @member.email
    assert_redirected_to admin_members_url
  end

  test 'should be able to delete a member' do
    sign_in @admin_user
    assert_difference('User.count', -1) do
      delete admin_member_url(@member), params: { id: @member.id }
    end
    assert_redirected_to admin_members_path
  end
end
