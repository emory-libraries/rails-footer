# Railsfooter

## Getting up and Running
Add this line to your application's Gemfile:

```ruby
gem "railsfooter", source: "https://gem.coop/@emorylibraries"
```

And then execute:
```bash
$ bundle install
```

For version 1.0, in the main application file (app/views/layouts/application.html.erb) place footer just above the </body> with 
```ruby
<%= render "railsfooter/footer" %>
``` 
and in the header, with the other stylesheet and js tags
```ruby
<%= stylesheet_link_tag "railsfooter/railsfooter" %>
```

If the app is using < Rails 8, add 
```ruby
//= link railsfooter/railsfooter.css
``` 
to app/assets/config/manifest.js

In cli: 
```bash
rails g emory_libraries_footer
```
will copy over a blank/test template footer_links partial, an rspec test, and an initializer for the version line (since we want it to have the version of the app, not the footer gem, it needs to be written over). 
Fill in the blanks in the footer_links and duplicate the `<li>` lines to build the footer menus.
If you are have previously installed railsfooter and/or are just updating and already have the files, the generator will recognize that and skip copying them over. 
The footer_version.rb file might need customizing based on the config of the deployed prod env and relative location of the 'revisions.log' file. It has fallback values so that it will still render something even if it doesn't hit the right path by default.

For an app with a docker container (like dlp-curate), might need to `docker compose down -v` and `docker compose up` again after install in order for it to recognize the app path. 

If applicable, you also will need to delete all of the footer-related files that this gem is replacing. Examples are possibly a footer partial, a footer stylesheet and import of the footer stylesheet into the main application stylesheet, or the footer section of that stylesheet.

## Random other notes
Some apps, for example, dlp-curate as of August 2026, don't use application.html as the root or homepage. Can look in routes.rb to determine which file is the root and place the footer render and the stylesheet header tag in that file, not layouts/application. 

