require "test_helper"
require "generators/obj/obj_generator"

class ObjGeneratorTest < Rails::Generators::TestCase
  tests ObjGenerator
  destination Rails.root.join("tmp/generators")
  setup :prepare_destination

  # test "generator runs without errors" do
  #   assert_nothing_raised do
  #     run_generator ["arguments"]
  #   end
  # end
end
