require 'test_helper'

class TvShowsControllerTest < ActionController::TestCase
  def setup
    @tv_show = tv_shows(:one)
    @user = users(:nick)
  end

  test "should get index" do
    log_in_as(@user)
    get :index
    assert_response :success
    assert_not_nil assigns(:tv_shows)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tv_show" do
    assert_difference('TvShow.count') do
      post :create, tv_show: { 
          created_by: @tv_show.created_by, 
          no_of_episodes: @tv_show.no_of_episodes, 
          first_air_date: @tv_show.first_air_date, 
          last_air_date: @tv_show.last_air_date, 
          name: @tv_show.name, 
          overview: @tv_show.overview, 
          poster_path: @tv_show.poster_path, 
          rating: @tv_show.rating, 
          no_of_seasons: @tv_show.no_of_seasons, 
          status: @tv_show.status, 
          votes: @tv_show.votes 
      }
    end

    assert_redirected_to tv_show_path(assigns(:tv_show))
  end

  test "should show tv_show" do
    log_in_as(@user)
    get :show, id: @tv_show
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tv_show
    assert_response :success
  end

  test "should update tv_show" do
    patch :update, id: @tv_show, tv_show: { 
      created_by: @tv_show.created_by, 
      no_of_episodes: @tv_show.no_of_episodes, 
      first_air_date: @tv_show.first_air_date, 
      last_air_date: @tv_show.last_air_date, 
      name: @tv_show.name, 
      overview: @tv_show.overview, 
      poster_path: @tv_show.poster_path, 
      rating: @tv_show.rating, 
      no_of_seasons: @tv_show.no_of_seasons, 
      status: @tv_show.status, 
      votes: @tv_show.votes 
    }
    assert_redirected_to tv_show_path(assigns(:tv_show))
  end

  test "should destroy tv_show" do
    assert_difference('TvShow.count', -1) do
      delete :destroy, id: @tv_show
    end

    assert_redirected_to tv_shows_path
  end
end
