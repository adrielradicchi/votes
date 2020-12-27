require "application_system_test_case"

class SurveyResponseUsersTest < ApplicationSystemTestCase
  setup do
    @survey_response_user = survey_response_users(:one)
  end

  test "visiting the index" do
    visit survey_response_users_url
    assert_selector "h1", text: "Survey Response Users"
  end

  test "creating a Survey response user" do
    visit survey_response_users_url
    click_on "New Survey Response User"

    fill_in "Session", with: @survey_response_user.session_id
    fill_in "Survey question", with: @survey_response_user.survey_question
    fill_in "Survey response", with: @survey_response_user.survey_response
    fill_in "User", with: @survey_response_user.user_id
    click_on "Create Survey response user"

    assert_text "Survey response user was successfully created"
    click_on "Back"
  end

  test "updating a Survey response user" do
    visit survey_response_users_url
    click_on "Edit", match: :first

    fill_in "Session", with: @survey_response_user.session_id
    fill_in "Survey question", with: @survey_response_user.survey_question
    fill_in "Survey response", with: @survey_response_user.survey_response
    fill_in "User", with: @survey_response_user.user_id
    click_on "Update Survey response user"

    assert_text "Survey response user was successfully updated"
    click_on "Back"
  end

  test "destroying a Survey response user" do
    visit survey_response_users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Survey response user was successfully destroyed"
  end
end
