require "test_helper"

class JobGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @job_group = job_groups(:one)
  end

  test "should get index" do
    get job_groups_url, as: :json
    assert_response :success
  end

  test "should create job_group" do
    assert_difference("JobGroup.count") do
      post job_groups_url, params: { job_group: { rate: @job_group.rate } }, as: :json
    end

    assert_response :created
  end

  test "should show job_group" do
    get job_group_url(@job_group), as: :json
    assert_response :success
  end

  test "should update job_group" do
    patch job_group_url(@job_group), params: { job_group: { rate: @job_group.rate } }, as: :json
    assert_response :success
  end

  test "should destroy job_group" do
    assert_difference("JobGroup.count", -1) do
      delete job_group_url(@job_group), as: :json
    end

    assert_response :no_content
  end
end
