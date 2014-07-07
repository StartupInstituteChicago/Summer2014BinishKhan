require 'test_helper'

class CubesControllerTest < ActionController::TestCase
  setup do
    @cube = cubes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cubes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cube" do
    assert_difference('Cube.count') do
      post :create, cube: {  }
    end

    assert_redirected_to cube_path(assigns(:cube))
  end

  test "should show cube" do
    get :show, id: @cube
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cube
    assert_response :success
  end

  test "should update cube" do
    patch :update, id: @cube, cube: {  }
    assert_redirected_to cube_path(assigns(:cube))
  end

  test "should destroy cube" do
    assert_difference('Cube.count', -1) do
      delete :destroy, id: @cube
    end

    assert_redirected_to cubes_path
  end
end
