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

For version 1.0, in the main application file (app/views/layouts/application.html.erb) place footer with 
```ruby
<%= render "railsfooter/footer" %>
``` 
and in the header 
```ruby
<%= stylesheet_link_tag "railsfooter/application.css"
```

If the app is using < Rails 8, add 
```ruby
//= link railsfooter/application.css
``` 
to app/assets/config/manifest.js

In cli: 
```bash
rails g links_file
```
 will copy over a blank/test template footer_links partial. Fill in the blanks and duplicate the <li> lines to build the footer menus.

