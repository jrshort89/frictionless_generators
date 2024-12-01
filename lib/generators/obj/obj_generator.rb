class ObjGenerator < Rails::Generators::NamedBase
  # rails g obj new_obj [x, y, z] --pretend
  # --pretend does exactly what it says, it doesn't actually make files
  ACCESSOR_LIMIT = 2

  source_root File.expand_path("templates", __dir__)
  # `argument :name` inherited from NamedBase

  remove_class_option :skip_namespace
  remove_class_option :skip_collision_check

  argument :accessors, type: :array, banner: "attr [attr]"

  class_option :comparable, type: :boolean, default: false,
    aliases: %w[-c],
    desc: "Include Comparable & <=>"

  def validate_accessors_count
    return unless accessors.size > ACCESSOR_LIMIT

    msg = <<~ERROR
    The generator can only accept #{ACCESSOR_LIMIT} accessors. 
    #{accessors.size} provided: #{accessors.to_sentence}.
  ERROR

    say_error msg

    if yes?("Continue with only the first 2 accessors? (y/n)")
      @accessors = accessors.take(2)
      say 'took first 2', :green
    else
      say 'failed to generate', :red
      exit 1
    end
  end
end
