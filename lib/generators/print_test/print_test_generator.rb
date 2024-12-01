class PrintTestGenerator < Rails::Generators::NamedBase
  source_root File.expand_path("templates", __dir__)

  def generic_print_method
    say "This text will stand out!", :red
    say "This text will stand out!", :on_red
    say "This text will stand out!", :bold
    say "This text will stand out!", [ :green, :on_red ]
    say "This text will stand out!", %i[red on_white bold]
  end

  # Foregrounds   # Backgrounds   # Bold
  # :black          :on_black       :bold
  # :red            :on_red
  # :green          :on_green
  # :yellow         :on_yellow
  # :blue           :on_blue
  # :magenta        :on_magenta
  # :cyan           :on_cyan
  # :white          :on_white

  def generic_status_method
    say_status "some status, yo", 'the status', :yellow
  end

  def display_some_error
    say_error "some error happened maybe"
  end

  def log_also_works
    log "Logger here!"
  end

  def example_print_wrapped
    # ignores quiet -q/--quiet
    print_wrapped "This is a long line of text that will be wrapped to fit the terminal width. Here's some extra words so that it wraps appropriately."
  end

  def example_print_table
    # ignores quiet -q/--quiet
    print_table [
                  %w[name email phone],
                  ["Luke Skywalker", "luke@example.com", "-"],
                  ["Leia Organa", "leia@example.com", "0-123-456-7890"],
                ]
  end
end
