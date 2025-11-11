# Railsfooter
Short description and motivation.

## Usage
How to use my plugin.

## Installation
Add this line to your application's Gemfile:

```ruby
gem "railsfooter", github "emory-libraries/rails-footer"
```

And then execute:
```bash
$ bundle install
```

For version 1.0, in the main application file (app/views/layouts/application.html.erb) place footer with `<%= render "railsfooter/footer" %>` and in the header `<%= stylesheet_link_tag "railsfooter/application.css"`
Then write or copy over app/views/railsfooter/_footer_links.html.erb and override manually.
If the app is using < Rails 8, add `//= link percyfooter/application.css` to app/assets/config/manifest.js

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
