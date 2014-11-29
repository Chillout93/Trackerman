require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def setup
    @user = users(:nick)
    @evil_user = users(:pikachu)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "redirect index when not logged in" do
    get :index
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "redirect edit when not logged in" do
    get :edit, id: @user
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "redirect update when not logged in" do
    patch :update, id: @user, user: { name: "Foo Bar",
                                    email: "foo@bar.com",
                                    password: "password",
                                    password_confirmation: "password" }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "redirect edit when logged in as wrong user" do
    log_in_as(@evil_user)
    get :edit, id: @user
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "redirect update when logged in as wrong user" do
    log_in_as(@evil_user)
    patch :update, id: @user, user: { name: "Foo Bar",
                                    email: "foo@bar.com",
                                    password: "password",
                                    password_confirmation: "password" }
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "redirect destroy when not logged in" do
    assert_no_difference 'User.count' do
      delete :destroy, id: @user
    end
    assert_redirected_to login_url
  end

  test "redirect destroy when not logged in as admin" do
    log_in_as(@evil_user)
    assert_no_difference 'User.count' do
      delete :destroy, id: @user
    end
    assert_redirected_to root_url
  end

  test "should not allow the admin attribute to be edited via the web" do
    log_in_as(@evil_user)
    assert_not @evil_user.admin?
    patch :update, id: @evil_user, user: {  password:              'password',
                                            password_confirmation: 'password',
                                            admin: true }
    assert_not @evil_user.admin?
  end
end
