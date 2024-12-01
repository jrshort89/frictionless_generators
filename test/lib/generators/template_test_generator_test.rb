require "test_helper"
require "generators/template_test/template_test_generator"

class TemplateTestGeneratorTest < Rails::Generators::TestCase
  tests TemplateTestGenerator
  destination Rails.root.join("tmp/generators")
  setup :prepare_destination

  # test "generator runs without errors" do
  #   assert_nothing_raised do
  #     run_generator ["arguments"]
  #   end
  # end
end
