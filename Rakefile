require "bundler/setup"
require "sass-embedded"  # the compiler; gives us Sass.compile
require "bundler/gem_tasks"

Rake::Task["build"].enhance(["css:build"])

APP_RAKEFILE = File.expand_path("test/dummy/Rakefile", __dir__)
load "rails/tasks/engine.rake"

GEM_ROOT = File.expand_path(__dir__)

namespace :css do
  desc "compile application.scss, with bootstrap, into railsfooter.css, and footer.scss singly into dist/footer.css"
  task :build do

    bootstrap_dir = Gem::Specification.find_by_name("bootstrap").gem_dir # ask gemcoop where the bootstrap gem is installed, without loading it. sits inside the task so it only runs at css:build, not every time rake loads.

    # 1. full stylesheet that ships with gem
    result = Sass.compile(
      "lib/railsfooter/scss/application.scss", # the entry point
      load_paths: [File.join(bootstrap_dir, "assets", "stylesheets")], # where `@import "bootstrap"` is found
      style: :compressed,
      quiet_deps: true, # Hide warnings that come from files found via load_paths, i.e. Bootstrap's own SCSS. Problems in YOUR files will still be reported.
      silence_deprecations: %w[import] # silencing Bootstrap 5.3 deprecation warnings about @import.
      )
    File.write("app/assets/stylesheets/railsfooter/railsfooter.css", result.css)

    # 2. footer only stylesheet, used just for vendor exprot. no bootstrap load_paths on purpose: if footer.scss ever tries to @import bootstrap, this compile will fail loudly instead of quietly pulliing all of bootstrap into the vendor file.
    FileUtils.mkdir_p("dist")
    footer = Sass.compile(
      "lib/railsfooter/scss/footer.scss",
      style: :compressed,
      silence_deprecations: %w[import]
    )
    File.write("dist/footer.css", footer.css)

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
      File.join(GEM_ROOT, "dist/footer.css")
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
