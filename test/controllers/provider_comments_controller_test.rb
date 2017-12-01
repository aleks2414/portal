require 'test_helper'

class ProviderCommentsControllerTest < ActionController::TestCase
  setup do
    @provider_comment = provider_comments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:provider_comments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create provider_comment" do
    assert_difference('ProviderComment.count') do
      post :create, provider_comment: { atencion: @provider_comment.atencion, calidad: @provider_comment.calidad, mensaje: @provider_comment.mensaje, nombre: @provider_comment.nombre, provider_id: @provider_comment.provider_id, servicio: @provider_comment.servicio }
    end

    assert_redirected_to provider_comment_path(assigns(:provider_comment))
  end

  test "should show provider_comment" do
    get :show, id: @provider_comment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @provider_comment
    assert_response :success
  end

  test "should update provider_comment" do
    patch :update, id: @provider_comment, provider_comment: { atencion: @provider_comment.atencion, calidad: @provider_comment.calidad, mensaje: @provider_comment.mensaje, nombre: @provider_comment.nombre, provider_id: @provider_comment.provider_id, servicio: @provider_comment.servicio }
    assert_redirected_to provider_comment_path(assigns(:provider_comment))
  end

  test "should destroy provider_comment" do
    assert_difference('ProviderComment.count', -1) do
      delete :destroy, id: @provider_comment
    end

    assert_redirected_to provider_comments_path
  end
end
