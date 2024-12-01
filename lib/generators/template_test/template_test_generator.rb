class TemplateTestGenerator < Rails::Generators::NamedBase
  source_root File.expand_path("templates", __dir__)

  def directory_test
    #          Source   Destination
    directory "icons", "app/assets/icons"
    # create  app/assets/icons (if it doesn't exist)
    # create  app/assets/icons/your_file_name_you_passed_to_the_generator.rb
  end

  def non_recursive
    directory "images", "public/images", recursive: false
  end
end
