require 'test_helper'

class ProviderAttachmentsControllerTest < ActionController::TestCase
  setup do
    @provider_attachment = provider_attachments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:provider_attachments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create provider_attachment" do
    assert_difference('ProviderAttachment.count') do
      post :create, provider_attachment: { image2: @provider_attachment.image2, provider_id: @provider_attachment.provider_id }
    end

    assert_redirected_to provider_attachment_path(assigns(:provider_attachment))
  end

  test "should show provider_attachment" do
    get :show, id: @provider_attachment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @provider_attachment
    assert_response :success
  end

  test "should update provider_attachment" do
    patch :update, id: @provider_attachment, provider_attachment: { image2: @provider_attachment.image2, provider_id: @provider_attachment.provider_id }
    assert_redirected_to provider_attachment_path(assigns(:provider_attachment))
  end

  test "should destroy provider_attachment" do
    assert_difference('ProviderAttachment.count', -1) do
      delete :destroy, id: @provider_attachment
    end

    assert_redirected_to provider_attachments_path
  end
end
