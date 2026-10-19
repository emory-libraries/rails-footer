require "bundler/setup"
require "bundler/gem_tasks"

APP_RAKEFILE = File.expand_path("test/dummy/Rakefile", __dir__)
load "rails/tasks/engine.rake"

GEM_ROOT = File.expand_path(__dir__)

namespace :css do
  desc "compile footer.scss singly into dist/footer.css for vendor export"
  task :footer do
    require "sass-embedded"  # the compiler; gives us Sass.compile
    FileUtils.mkdir_p(File.join(GEM_ROOT, "dist"))
    out = Sass.compile(File.join(GEM_ROOT, "lib/railsfooter/scss/footer.scss"), 
                       style: :compressed, silence_deprecations: %w[import])
    File.write(File.join(GEM_ROOT, "dist/footer.css"), out.css)
  end

  desc "compile application.scss into railsfooter.css, plus footer.css"
  task build: :footer do
    require "sass-embedded"  # the compiler; gives us Sass.compile
    out = Sass.compile(File.join(GEM_ROOT, "lib/railsfooter/scss/application.scss"),
                       style: :compressed, silence_deprecations: %w[import])
    File.write(File.join(GEM_ROOT, "app/assets/stylesheets/railsfooter/railsfooter.css"), out.css)
  end
end

namespace :footer do
  desc "Render the footer from test/dummy to a standalone HTML file at dist/footer.html"
  task export: "css:build" do #css:build runs first

    require "sass-embedded"  # the compiler; gives us Sass.compile
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
