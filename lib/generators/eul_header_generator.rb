class EulHeaderGenerator < Rails::Generators::Base
  desc "this generator copies over everything you need to get header basics in place and ready to customize"
  source_root File.expand_path("../../templates/header", __dir__)

  # giving them a links file
  def write_links_file
    # where to look for it?
    host_links_file = File.join(destination_root, "app/views/railsfooter/_header_navlinks.html.erb")

    # IF they don't already have the links file, copy over a blank one.
    if File.exist?(host_links_file)
      puts "awesome, you already have your links file"
    else
      copy_file "_header_navlinks.html.erb", "app/views/railsfooter/_header_navlinks.html.erb"
    end
  end

  # giving them a lovely test for their test suite
  # def write_spec_file
    # copy over a test file. copy_file will overwrite an existing file of the same name.
    # copy_file "header_gem_test_spec.rb", "spec/features/header_gem_test_spec.rb"
  # end
end
