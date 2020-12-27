require "test_helper"
require "generators/survey_controller/survey_controller_generator"

class SurveyControllerGeneratorTest < Rails::Generators::TestCase
  tests SurveyControllerGenerator
  destination Rails.root.join('tmp/generators')
  setup :prepare_destination

  # test "generator runs without errors" do
  #   assert_nothing_raised do
  #     run_generator ["arguments"]
  #   end
  # end
end
