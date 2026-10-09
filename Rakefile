require "bundler/setup"
require "sass-embedded"  # the compiler; gives us Sass.compile
require "bundler/gem_tasks"

Rake::Task["build"].enhance(["css:build"])

APP_RAKEFILE = File.expand_path("test/dummy/Rakefile", __dir__)
load "rails/tasks/engine.rake"

GEM_ROOT = File.expand_path(__dir__)

namespace :css do
  desc "compile application.scss, with bootstrap, into railsfooter.css"
  task :build do

    bootstrap_dir = Gem::Specification.find_by_name("bootstrap").gem_dir # ask gemcoop where the bootstrap gem is installed, without loading it. sits inside the task so it only runs at css:build, not every time rake loads.

    result = Sass.compile(
      "lib/railsfooter/scss/application.scss", # the entry point
      load_paths: [File.join(bootstrap_dir, "assets", "stylesheets")], # where `@import "bootstrap"` is found
      style: :compressed,
      quiet_deps: true, # Hide warnings that come from files found via load_paths, i.e. Bootstrap's own SCSS. Problems in YOUR files will still be reported.
      silence_deprecations: %w[import] # silencing Bootstrap 5.3 deprecation warnings about @import.
      )
    File.write("app/assets/stylesheets/railsfooter/railsfooter.css", result.css)
  end
end

# Re-declaring `build` with a prerequisite doesn't replace it. It adds "run css:build first" in front of what `build` already does.
task build: "css:build"


namespace :footer do
  desc "Render the footer from test/dummy to a standalone HTML file at dist/footer.html"
  task export: "css:build" do #css:build runs first

    ENV["RAILS_ENV"] = "test"
    require File.join(GEM_ROOT, "test/dummy/config/environment")

    css = File.read(
      File.join(GEM_ROOT, "app/assets/stylesheets/railsfooter/railsfooter.css")
    )

    # ActionController::Base avoids depending on the dummy's own controllers
    html = ActionController::Base.render(
      template: "vendor_export/footer",
      layout: false,
      locals: { css: css }
    )

    FileUtils.mkdir_p(File.join(GEM_ROOT, "dist"))
    File.write(File.join(GEM_ROOT, "dist/footer.html"), html)
    puts "wrote dist/footer.html (#{html.bytesize} bytes)"
  end
end
