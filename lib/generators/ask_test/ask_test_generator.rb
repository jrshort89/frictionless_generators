class AskTestGenerator < Rails::Generators::NamedBase
  source_root File.expand_path("templates", __dir__)

  def ask_examples
    # Captures the provided string
    ask "What is your name?"

    # `default: "Pluto" provides a default automatically
    ask "What is the planet furthest from the sun?", default: "Pluto"

    # `echo: false` hides sensitive content from the screen
    ask "What is your password?", echo: false

    # `path: true` enables tab completion for selecting a path
    ask "Where should the file be saved?", path: true

    # `limited_to` restricts the acceptable response set
    ask "What is your favorite Neopolitan flavor?", limited_to: %w[
      strawberry
      chocolate
      vanilla
    ]

    yes? "Do you love generators?" # Returns true if "y" or "yes"
    no? "Do you hate generators?" # Returns true if "n" or "no"
  end
end
