class EmoryLibrariesFooterGenerator < Rails::Generators::Base
  desc "this generator copies over everything you need to get started"
  source_root File.expand_path("../../templates", __dir__)

  # giving them a links file
  def write_links_file
    # where to look for it?
    host_file = File.join(destination_root, "app/views/railsfooter/_footer_links.html.erb")

    # IF they don't already have the links file, copy over a blank one.
    if File.exist?(host_file)
      puts "awesome, you already have your links file"
    else
      copy_file "_footer_links.html.erb", "app/views/railsfooter/_footer_links.html.erb"
    end
  end

  # giving them a lovely test for their test suite
  def write_spec_file
    # copy over a test file. will use copy_file? to write/overwrite an existing test file. can instruct to rename the test if they edit?
    copy_file "footer_has_links_spec.rb", "spec/features/footer_has_links_spec.rb"
  end
end
