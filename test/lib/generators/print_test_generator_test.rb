require "test_helper"
require "generators/print_test/print_test_generator"

class PrintTestGeneratorTest < Rails::Generators::TestCase
  tests PrintTestGenerator
  destination Rails.root.join("tmp/generators")
  setup :prepare_destination

  # test "generator runs without errors" do
  #   assert_nothing_raised do
  #     run_generator ["arguments"]
  #   end
  # end
end
