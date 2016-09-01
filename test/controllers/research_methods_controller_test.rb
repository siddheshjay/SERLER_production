require 'test_helper'

class ResearchMethodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @research_method = research_methods(:one)
  end

  test "should get index" do
    get research_methods_url
    assert_response :success
  end

  test "should get new" do
    get new_research_method_url
    assert_response :success
  end

  test "should create research_method" do
    assert_difference('ResearchMethod.count') do
      post research_methods_url, params: { research_method: { method_name: @research_method.method_name, method_status: @research_method.method_status, research_method_id: @research_method.research_method_id } }
    end

    assert_redirected_to research_method_url(ResearchMethod.last)
  end

  test "should show research_method" do
    get research_method_url(@research_method)
    assert_response :success
  end

  test "should get edit" do
    get edit_research_method_url(@research_method)
    assert_response :success
  end

  test "should update research_method" do
    patch research_method_url(@research_method), params: { research_method: { method_name: @research_method.method_name, method_status: @research_method.method_status, research_method_id: @research_method.research_method_id } }
    assert_redirected_to research_method_url(@research_method)
  end

  test "should destroy research_method" do
    assert_difference('ResearchMethod.count', -1) do
      delete research_method_url(@research_method)
    end

    assert_redirected_to research_methods_url
  end
end
