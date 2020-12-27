require "application_system_test_case"

class SurveyResponsesTest < ApplicationSystemTestCase
  setup do
    @survey_response = survey_responses(:one)
  end

  test "visiting the index" do
    visit survey_responses_url
    assert_selector "h1", text: "Survey Responses"
  end

  test "creating a Survey response" do
    visit survey_responses_url
    click_on "New Survey Response"

    fill_in "Response", with: @survey_response.response
    fill_in "Survey question", with: @survey_response.survey_question_id
    click_on "Create Survey response"

    assert_text "Survey response was successfully created"
    click_on "Back"
  end

  test "updating a Survey response" do
    visit survey_responses_url
    click_on "Edit", match: :first

    fill_in "Response", with: @survey_response.response
    fill_in "Survey question", with: @survey_response.survey_question_id
    click_on "Update Survey response"

    assert_text "Survey response was successfully updated"
    click_on "Back"
  end

  test "destroying a Survey response" do
    visit survey_responses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Survey response was successfully destroyed"
  end
end
