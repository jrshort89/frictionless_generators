require "test_helper"
require "generators/copy_machine/copy_machine_generator"

class CopyMachineGeneratorTest < Rails::Generators::TestCase
  tests CopyMachineGenerator
  destination Rails.root.join("tmp/generators")
  setup :prepare_destination

  # test "generator runs without errors" do
  #   assert_nothing_raised do
  #     run_generator ["arguments"]
  #   end
  # end
end
