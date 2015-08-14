require 'test_helper'

class VouepsControllerTest < ActionController::TestCase
  setup do
    @vouep = voueps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:voueps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vouep" do
    assert_difference('Vouep.count') do
      post :create, vouep: { auto_desk_url: @vouep.auto_desk_url, content_type: @vouep.content_type, file_content: @vouep.file_content, filename: @vouep.filename }
    end

    assert_redirected_to vouep_path(assigns(:vouep))
  end

  test "should show vouep" do
    get :show, id: @vouep
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vouep
    assert_response :success
  end

  test "should update vouep" do
    patch :update, id: @vouep, vouep: { auto_desk_url: @vouep.auto_desk_url, content_type: @vouep.content_type, file_content: @vouep.file_content, filename: @vouep.filename }
    assert_redirected_to vouep_path(assigns(:vouep))
  end

  test "should destroy vouep" do
    assert_difference('Vouep.count', -1) do
      delete :destroy, id: @vouep
    end

    assert_redirected_to voueps_path
  end
end
