# SwaggeruiLocal

[![swaggerui_local](https://badgen.net/rubygems/v/swaggerui_local)](https://rubygems.org/gems/swaggerui_local)

Do you want to use Swagger UI on your local machine without assets precompile?
Use this gem!
[Original URL to Swagger UI](https://petstore.swagger.io)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'swaggerui_local'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install swaggerui_local

## Usage

```ruby
require 'swaggerui_local'
path_to_swagger_json = 'localhost:3000/api/doc/swagger.json'
SwaggeruiLocal.render_html(path_to_swagger_json)
```

An example of usage with Roda

```ruby
require 'roda'
require 'swaggerui_local'
YOUR_SWAGGER_JSON = {}

class App < Roda
  plugin :json
  route do |r|
    r.on 'swagger_json' do
      r.is do
        # route: GET /swagger_json
        r.get do
            YOUR_SWAGGER_JSON
        end
      end
    end
    r.on 'swagger_ui' do
      r.is do
        # route: GET /swagger_ui
        r.get do
          path_to_swagger_json = 'http://localhost:9292/swagger_json'
          SwaggeruiLocal.render_html(path_to_swagger_json)
        end
      end
    end
  end
end

run App.freeze.app
```

Run the server

```ruby
rack up
```

And then open localhost:9292/swagger_ui

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kopylovvlad/swaggerui_local. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [Mozilla Public License 2.0](https://choosealicense.com/licenses/mpl-2.0/).
