require "test_helper"

class RecordsOfWorkControllerTest < ActionDispatch::IntegrationTest
  setup do
    @record_of_work = records_of_work(:one)
  end

  test "should get index" do
    get records_of_work_url, as: :json
    assert_response :success
  end

  test "should create record_of_work" do
    assert_difference("RecordOfWork.count") do
      post records_of_work_url, params: { record_of_work: { hours: @record_of_work.hours } }, as: :json
    end

    assert_response :created
  end

  test "should show record_of_work" do
    get record_of_work_url(@record_of_work), as: :json
    assert_response :success
  end

  test "should update record_of_work" do
    patch record_of_work_url(@record_of_work), params: { record_of_work: { hours: @record_of_work.hours } }, as: :json
    assert_response :success
  end

  test "should destroy record_of_work" do
    assert_difference("RecordOfWork.count", -1) do
      delete record_of_work_url(@record_of_work), as: :json
    end

    assert_response :no_content
  end
end
