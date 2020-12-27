require "test_helper"

class SurveyResponseUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @survey_response_user = survey_response_users(:one)
  end

  test "should get index" do
    get survey_response_users_url
    assert_response :success
  end

  test "should get new" do
    get new_survey_response_user_url
    assert_response :success
  end

  test "should create survey_response_user" do
    assert_difference('SurveyResponseUser.count') do
      post survey_response_users_url, params: { survey_response_user: { session_id: @survey_response_user.session_id, survey_question: @survey_response_user.survey_question, survey_response: @survey_response_user.survey_response, user_id: @survey_response_user.user_id } }
    end

    assert_redirected_to survey_response_user_url(SurveyResponseUser.last)
  end

  test "should show survey_response_user" do
    get survey_response_user_url(@survey_response_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_survey_response_user_url(@survey_response_user)
    assert_response :success
  end

  test "should update survey_response_user" do
    patch survey_response_user_url(@survey_response_user), params: { survey_response_user: { session_id: @survey_response_user.session_id, survey_question: @survey_response_user.survey_question, survey_response: @survey_response_user.survey_response, user_id: @survey_response_user.user_id } }
    assert_redirected_to survey_response_user_url(@survey_response_user)
  end

  test "should destroy survey_response_user" do
    assert_difference('SurveyResponseUser.count', -1) do
      delete survey_response_user_url(@survey_response_user)
    end

    assert_redirected_to survey_response_users_url
  end
end
