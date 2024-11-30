class InitializerGenerator < Rails::Generators::NamedBase
  source_root File.expand_path("templates", __dir__)
  class_option :scope, type: :string, optional: false, hide: false, desc: 'jake is rad'
  # the following defaults to optional: true - same with default values
  # class_option :scope, type: :string, hide: false, desc: 'jake is rad'
  # class_option :scope, type: :string, hide: false, desc: 'jake is rad', default: 'some_scope'

  class_option :open, type: :boolean, group: :some_custom_group, desc: 'test option that controls the actual generator', default: true # we can pass '--open' alone for true or nothing/'--no-open' for implicit/explicit false

  class_option :save_results, type: :boolean, group: :some_custom_group,
    aliases: %w[-s --save] # instead of options[:save], we can use -s='something' or --save='something too'
    # can use hide and banner

    # class_at_least_one do
    #   # the generator will require a value for at least one of the options
    #   class_option :support_email, alias: %w[--support-email] # -se --se do not work as aliases
    #   class_option :privacy_email, alias: %w[--privacy]
    # end

  class_exclusive :support_email, :privacy_email # can only pick one of the options

  argument :extra, type: :hash, optional: false, banner: "cat|dog|monkey"

  # generators run public methods in order from top to bottom
  def copy_initializer_file
    return unless options[:open]

    copy_file "initializer.rb", "config/initializers/#{file_name}.rb"
  end

  def animale_name
    if options[:open]
      puts 'it is open'
    end
  end

  private

  def save?
    options[:save_results]
  end
end
