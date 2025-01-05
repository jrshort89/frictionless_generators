require "test_helper"
require "generators/file_editor/file_editor_generator"

class FileEditorGeneratorTest < Rails::Generators::TestCase
  tests FileEditorGenerator
  destination Rails.root.join("tmp/generators")
  setup :prepare_destination

  # test "generator runs without errors" do
  #   assert_nothing_raised do
  #     run_generator ["arguments"]
  #   end
  # end
end
