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

  # writing over the version definition file
  def write_version_line_values_file
    # copy over the version file. will overwrite an existing file of the same name.
    copy_file "footer_version.rb", "config/initializers/footer_version.rb"
  end

  # giving them a lovely test for their test suite
  def write_spec_file
    # copy over a test file. copy_file will overwrite an existing file of the same name.
    copy_file "footer_gem_test_spec.rb", "spec/features/footer_gem_test_spec.rb"
  end
end
