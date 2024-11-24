class InitializerGenerator < Rails::Generators::NamedBase
  source_root File.expand_path("templates", __dir__)
  class_option :scope, type: :string, default: "app"

  def copy_initializer_file
    @scope = options["scope"]
  end
end
