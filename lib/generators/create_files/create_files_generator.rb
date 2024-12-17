class CreateFilesGenerator < Rails::Generators::NamedBase
  source_root File.expand_path("templates", __dir__)

  # def create_basic_class_file
  #   # Creates `app/models/email.rb` inside `destination_root` and
  #   #   populates it with the class declaration. No templates.
  #   create_file "app/models/email.rb", "class Email; end"
  # end
  #
  # def create_class_file
  #   create_file "#{file_name}.rb" do
  #     <<~CONTENT
  #     class <% class_name %>
  #       attr_accessor :key, :value
  #     end
  #   CONTENT
  #   end
  # end
  #
  # def create_complex_class_file
  #   create_file "#{file_name}.rb" do
  #     content = []
  #     content << "class #{class_name}"
  #     if attributes.any?
  #       names = attributes_names.map { |a| ":#{a}" }.join(", ")
  #       content << "  attr_accessor #{names}"
  #     end
  #     content << "end"
  #     content.join("\n")
  #   end
  # end
  #
  # def two_initializer_options
  #   initializer "fancy.rb", "# Initialize!"
  #   # ...is a more convenient option for...
  #   create_file "config/initializers/fancy.rb", "# Initialize!"
  # end
  #
  # def initializer_with_block
  #   initializer("generators-block.rb") do
  #     ['Load', 'Run', 'Generate'].map do |step|
  #       "# #{step}"
  #     end.join("\n\n")
  #   end
  #   #
  #   # makes a ruby file with the following:
  #   # # Load
  #   #
  #   # # Run
  #   #
  #   # # Generate
  # end

  # def generate_rake_file
  #   # Building a rake task with a string...
  #   rakefile 'generate.rake', 'puts "Generating!"'
  #
  #   # Building a rake task with a block...
  #   rakefile "generate-block.rake" do
  #     <<~TASK
  #   namespace :generate do
  #     task :files do
  #       puts "Files generated!"
  #     end
  #   end
  # TASK
  #   end
  # end

  def generate_task_with_built_in_method
    generate :task, "task_name action_one action_two"
  end

  def vendor_builder
    vendor "vendor.rb", "# Vendor-specific stuff!"
    vendor "vendor-block.rb" do
      api_key = rand(10_000)
      "API_KEY = #{api_key}"
    end
  end

  def lib_builder
    lib "library.rb", "# Utilities can go here!"
    lib "library-block.rb" do
      <<~UTILITIES
      module Utilities
      end
    UTILITIES
    end
  end
end
