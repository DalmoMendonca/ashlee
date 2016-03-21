require 'test_helper'

class FlairsControllerTest < ActionController::TestCase
  setup do
    @flair = flairs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:flairs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create flair" do
    assert_difference('Flair.count') do
      post :create, flair: { category: @flair.category, content: @flair.content, name: @flair.name }
    end

    assert_redirected_to flair_path(assigns(:flair))
  end

  test "should show flair" do
    get :show, id: @flair
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @flair
    assert_response :success
  end

  test "should update flair" do
    patch :update, id: @flair, flair: { category: @flair.category, content: @flair.content, name: @flair.name }
    assert_redirected_to flair_path(assigns(:flair))
  end

  test "should destroy flair" do
    assert_difference('Flair.count', -1) do
      delete :destroy, id: @flair
    end

    assert_redirected_to flairs_path
  end
end
