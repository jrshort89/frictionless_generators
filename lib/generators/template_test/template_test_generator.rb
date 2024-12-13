class TemplateTestGenerator < Rails::Generators::NamedBase
  source_root File.expand_path("templates", __dir__)

  # def directory_test
  #   #          Source   Destination
  #   directory "icons", "app/assets/icons"
  #   # create  app/assets/icons (if it doesn't exist)
  #   # create  app/assets/icons/your_file_name_you_passed_to_the_generator.rb
  # end
  #
  # def non_recursive
  #   #          Source               Destination
  #   directory "images", "public/images", recursive: false
  # end

  def template_example
  #   # Assuming three files in the templates folder...
  #   # - model.rb.tt
  #   # - fixtures.yml.tt
  #   # - model_test.rb.tt
  #
  #   # With the template action...
  #   template "model.rb",      "app/models/#{file_name}.rb"
  #   # fixture_file_name makes the file name plural
  #   template "fixtures.yml",  "tests/fixtures/#{fixture_file_name}.yml"
  # File.join is OS safe
    template "model_test.rb", File.join("tests", "models", "#{file_name}_test.rb")
  end

  # def directory_example
  #   # Assuming this directory structure in the templates folder...
  #   # - model_files/app/models/%file_name%.rb.tt
  #   # - model_test_files/tests/fixtures/%fixture_file_name%.yml.tt
  #   # - model_test_files/tests/models/%file_name%_test.rb.tt
  #
  #   # With the directory action...
  #   directory "model_files"
  #   directory "model_test_files"
  # end
end
