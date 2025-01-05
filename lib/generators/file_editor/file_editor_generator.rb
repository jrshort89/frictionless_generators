class FileEditorGenerator < Rails::Generators::NamedBase
  source_root File.expand_path("templates", __dir__)

  def prependable
    prepend_to_file "lib/generators/file_editor/templates/file.rb", "# Prepended via prepend_to_file with string\n\n"
    prepend_to_file "lib/generators/file_editor/templates/file.rb" do
      "# Prepended via prepend_to_file with block\n\n"
    end
  end

  def insertable
    insert_into_file "lib/generators/file_editor/templates/file.rb", "# frozen_string_literal: true\n\n",
                     before: "class InsertIntoFile\n"
    insert_into_file "lib/generators/file_editor/templates/file.rb", "  attr_reader :first\n",
                     after: "class InsertIntoFile\n"
  end

  def insert_into_class_or_module_immediately
    #                  Target     Class Name         Content
    inject_into_class "file.rb", "InjectIntoClass", "  ORDER = :alpha\n"
    inject_into_class "file.rb", InjectIntoClass do
      "  FALLBACK_ORDER = :numeric\n"
    end

    #                  Target     Module Name          Content
    inject_into_module "file.rb", "InjectIntoModule", "  ORDER = :alpha\n"
    inject_into_module "file.rb", InjectIntoModule do
      "  FALLBACK_ORDER = :numeric\n"
    end

    # with_indentation do
    #   # @indentation = 1
    #   # indentation = @indentation * 2 = 2 spaces
    #   with_indentation do
    #     # @indentation = 2
    #     # indentation = @indentation * 2 = 4 spaces
    #     "#{indentation}class ClassName\n#{indentation}end\n"
    #   end
    # end
#     too_much_indentation = <<~INDENTED
#           class Point
#             attr_accessor :x, :y
#           end
# INDENTED
#
#     # Remove the first 10 spaces from each line and then add 2 leading
#     #   spaces to each line without affecting nested indentation.
#     proper_indentation = optimize_indentation(too_much_indentation, 2)
  end
end
