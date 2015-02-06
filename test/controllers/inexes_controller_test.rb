require 'test_helper'

class InexesControllerTest < ActionController::TestCase
  setup do
    @inex = inexes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:inexes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create inex" do
    assert_difference('Inex.count') do
      post :create, inex: { category_id: @inex.category_id, cost: @inex.cost, name: @inex.name, user_id: @inex.user_id }
    end

    assert_redirected_to inex_path(assigns(:inex))
  end

  test "should show inex" do
    get :show, id: @inex
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @inex
    assert_response :success
  end

  test "should update inex" do
    patch :update, id: @inex, inex: { category_id: @inex.category_id, cost: @inex.cost, name: @inex.name, user_id: @inex.user_id }
    assert_redirected_to inex_path(assigns(:inex))
  end

  test "should destroy inex" do
    assert_difference('Inex.count', -1) do
      delete :destroy, id: @inex
    end

    assert_redirected_to inexes_path
  end
end
