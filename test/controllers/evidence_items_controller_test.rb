require 'test_helper'

class EvidenceItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @evidence_item = evidence_items(:one)
  end

  test "should get index" do
    get evidence_items_url
    assert_response :success
  end

  test "should get new" do
    get new_evidence_item_url
    assert_response :success
  end

  test "should create evidence_item" do
    assert_difference('EvidenceItem.count') do
      post evidence_items_url, params: { evidence_item: { benefit_comeout: @evidence_item.benefit_comeout, confidence_rate: @evidence_item.confidence_rate, context: @evidence_item.context, evidence_id: @evidence_item.evidence_id, integrity: @evidence_item.integrity } }
    end

    assert_redirected_to evidence_item_url(EvidenceItem.last)
  end

  test "should show evidence_item" do
    get evidence_item_url(@evidence_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_evidence_item_url(@evidence_item)
    assert_response :success
  end

  test "should update evidence_item" do
    patch evidence_item_url(@evidence_item), params: { evidence_item: { benefit_comeout: @evidence_item.benefit_comeout, confidence_rate: @evidence_item.confidence_rate, context: @evidence_item.context, evidence_id: @evidence_item.evidence_id, integrity: @evidence_item.integrity } }
    assert_redirected_to evidence_item_url(@evidence_item)
  end

  test "should destroy evidence_item" do
    assert_difference('EvidenceItem.count', -1) do
      delete evidence_item_url(@evidence_item)
    end

    assert_redirected_to evidence_items_url
  end
end
