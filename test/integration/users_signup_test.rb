require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: { name:"", email:"user@invalid", password:"foo", password_confirmation:"bar" }
    end
    assert_template 'users/new'
  end

  test "valid signup" do
    get signup_path
    assert_difference 'User.count' do
      post_via_redirect users_path, user: { name:"nick", email:"test@gmail.com", password:"password", password_oonfirmation:"password" }
    end
    assert_template 'users/show'
    assert_select 'class="alert alert-success"'
  end
end
