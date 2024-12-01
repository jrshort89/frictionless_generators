require "test_helper"
require "generators/ask_test/ask_test_generator"

class AskTestGeneratorTest < Rails::Generators::TestCase
  tests AskTestGenerator
  destination Rails.root.join("tmp/generators")
  setup :prepare_destination

  # test "generator runs without errors" do
  #   assert_nothing_raised do
  #     run_generator ["arguments"]
  #   end
  # end
end
