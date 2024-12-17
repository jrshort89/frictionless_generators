class CopyMachineGenerator < Rails::Generators::NamedBase
  source_root File.expand_path("templates", __dir__)

  def copying
    # Copy the file and keep the name
    #   from `lib/generators/<generator_name>/templates/file.rb`
    #   to   `/file.rb` (in `destination_root`)
    copy_file "file.rb"

    # Copy and rename
    #   from `lib/generators/<generator_name>/templates/file.rb`
    #   to   `/copied_file.rb` (in `destination_root`)
    copy_file "file.rb", "copied_file.rb"

    # Copy and modify the contents for the new file
    #   from `lib/generators/<generator_name>/templates/file.rb`
    #   to   `/copy_file_block.rb` (in `destination_root`)
    #   and adds a comment at the top of the new file
    copy_file "file.rb", "copy_file_block.rb" do |content|
      "# Copied by `copy_file`\n\n#{content}"
    end
  end
end
