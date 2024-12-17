require "test_helper"
require "generators/create_files/create_files_generator"

class CreateFilesGeneratorTest < Rails::Generators::TestCase
  tests CreateFilesGenerator
  destination Rails.root.join("tmp/generators")
  setup :prepare_destination

  # test "generator runs without errors" do
  #   assert_nothing_raised do
  #     run_generator ["arguments"]
  #   end
  # end
end
