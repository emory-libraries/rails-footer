# Railsfooter

## Getting up and Running
Add this line to your application's Gemfile:

```ruby
gem "railsfooter", github: "emory-libraries/rails-footer"
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
<%= stylesheet_link_tag "railsfooter/application.css" %>
```

If the app is using < Rails 8, add 
```ruby
//= link railsfooter/application.css
``` 
to app/assets/config/manifest.js

In cli: 
```bash
rails g emory_libraries_footer
```
 will copy over a blank/test template footer_links partial. Fill in the blanks and duplicate the `<li>` lines to build the footer menus.

For an app with a docker container (like dlp-curate), might need to `docker compose down -v` and `docker compose up` again after install in order for it to recognize the app path. 

## Random other notes
Some apps, for example, dlp-curate as of August 2026, don't use application.html as the root or homepage. Can look in routes.rb to determine which file is the root and place the footer render and the stylesheet header tag in that file, not layouts/application.

