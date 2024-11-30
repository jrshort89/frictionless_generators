class ObjGenerator < Rails::Generators::NamedBase
  source_root File.expand_path("templates", __dir__)
  # `argument :name` inherited from NamedBase
  argument :accessors, type: :array

  class_option :comparable, type: :boolean, default: false
end
