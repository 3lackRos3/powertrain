require 'test_helper'

class EnginesControllerTest < ActionController::TestCase
  setup do
    @engine = engines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:engines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create engine" do
    assert_difference('Engine.count') do
      post :create, engine: { availability: @engine.availability, description: @engine.description, image_urls: @engine.image_urls, price: @engine.price, product_code: @engine.product_code, stock_status: @engine.stock_status, subtitle: @engine.subtitle, title: @engine.title }
    end

    assert_redirected_to engine_path(assigns(:engine))
  end

  test "should show engine" do
    get :show, id: @engine
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @engine
    assert_response :success
  end

  test "should update engine" do
    patch :update, id: @engine, engine: { availability: @engine.availability, description: @engine.description, image_urls: @engine.image_urls, price: @engine.price, product_code: @engine.product_code, stock_status: @engine.stock_status, subtitle: @engine.subtitle, title: @engine.title }
    assert_redirected_to engine_path(assigns(:engine))
  end

  test "should destroy engine" do
    assert_difference('Engine.count', -1) do
      delete :destroy, id: @engine
    end

    assert_redirected_to engines_path
  end
end
