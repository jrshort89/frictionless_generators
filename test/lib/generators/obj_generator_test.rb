require "test_helper"
require "generators/obj/obj_generator"

class ObjGeneratorTest < Rails::Generators::TestCase
  tests ObjGenerator
  destination Rails.root.join("tmp/generators")
  setup :prepare_destination
  arguments %w[Point x y]

  test "generator runs without errors" do
    # Since the values are already Ruby, this can mask issues that
    #   might otherwise arise from the generator parsing the values
    #   from the command line and converting them.
    arg_one = 'sample_name'
    arg_two = 'some other arg'
    args = [arg_one, arg_two]
    opts = { one: 1, two: 2 }
    g = generator(args, opts)

    # A more accurate test of day-to-day usage...
    run_generator
  end

  test "generates the object file" do
    run_generator
    assert_file "app/models/point.rb" do |content|
      assert_match(/class Point/, content)
    end
  end

  test "generates the object test file" do
    run_generator
    assert_file "test/models/point_test.rb" do |content|
      assert_match(/class PointTest < ActiveSupport::TestCase/, content)
    end
  end

  test "supports specifying attr_accessor fields for the model" do
    run_generator
    assert_file "app/models/point.rb" do |content|
      assert_match "attr_accessor :x, :y", content
      assert_method :initialize, content do |method_content|
        assert_match "@x = x", method_content
        assert_match "@y = y", method_content
      end
    end
  end

  test "supports specifying --comparable for the model" do
    run_generator %w[Point x y --comparable]
    assert_file "app/models/point.rb" do |content|
      assert_match(/include Comparable/, content)
      assert_instance_method '<=>', content
    end
  end

  test "supports specifying or --no-comparable for the model" do
    run_generator %w[Point x y --no-comparable]
    assert_file "app/models/point.rb" do |content|
      assert_no_match(/include Comparable/, content)
      assert_no_match("def <=>", content)
    end
  end

  test "generates the model file" do
    run_generator
    assert_file "app/models/point.rb" do |content|
      assert_match(/class Point/, content)
      assert_instance_method(:to_h, content)
      assert_instance_method(:to_a, content)
      assert_instance_method(:to_s, content)
    end
  end
end
