require 'test_helper'

class ArtistCallsControllerTest < ActionController::TestCase
  setup do
    @artist_call = artist_calls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:artist_calls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create artist_call" do
    assert_difference('ArtistCall.count') do
      post :create, artist_call: {  }
    end

    assert_redirected_to artist_call_path(assigns(:artist_call))
  end

  test "should show artist_call" do
    get :show, id: @artist_call
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @artist_call
    assert_response :success
  end

  test "should update artist_call" do
    put :update, id: @artist_call, artist_call: {  }
    assert_redirected_to artist_call_path(assigns(:artist_call))
  end

  test "should destroy artist_call" do
    assert_difference('ArtistCall.count', -1) do
      delete :destroy, id: @artist_call
    end

    assert_redirected_to artist_calls_path
  end
end
