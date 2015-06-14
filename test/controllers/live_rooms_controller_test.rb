require 'test_helper'

class LiveRoomsControllerTest < ActionController::TestCase
  setup do
    @live_room = live_rooms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:live_rooms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create live_room" do
    assert_difference('LiveRoom.count') do
      post :create, live_room: { name: @live_room.name, url: @live_room.url }
    end

    assert_redirected_to live_room_path(assigns(:live_room))
  end

  test "should show live_room" do
    get :show, id: @live_room
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @live_room
    assert_response :success
  end

  test "should update live_room" do
    patch :update, id: @live_room, live_room: { name: @live_room.name, url: @live_room.url }
    assert_redirected_to live_room_path(assigns(:live_room))
  end

  test "should destroy live_room" do
    assert_difference('LiveRoom.count', -1) do
      delete :destroy, id: @live_room
    end

    assert_redirected_to live_rooms_path
  end
end
