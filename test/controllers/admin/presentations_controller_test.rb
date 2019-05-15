require 'test_helper'

class Admin::PresentationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @presentation = presentations(:one)
  end

  test "should get index" do
    get admin_presentations_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_presentation_url
    assert_response :success
  end

  test "should create presentation" do
    assert_difference('Presentation.count') do
      post admin_presentations_url, params: { presentation: {  } }
    end

    assert_redirected_to presentation_url(Presentation.last)
  end

  test "should show presentation" do
    get admin_presentation_url(@presentation)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_presentation_url(@presentation)
    assert_response :success
  end

  test "should update presentation" do
    patch admin_presentation_url(@presentation), params: { presentation: {  } }
    assert_redirected_to presentation_url(@presentation)
  end

  test "should destroy presentation" do
    assert_difference('Presentation.count', -1) do
      delete admin_presentation_url(@presentation)
    end

    assert_redirected_to admin_presentations_url
  end
end
