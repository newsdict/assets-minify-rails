# Assets::Minify::Rails

![release](https://img.shields.io/github/v/release/newsdict/assets-minify-rails)
![license](https://img.shields.io/github/license/newsdict/assets-minify-rails)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'assets-minify-rails'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install asset-minify-rails

## Usage

When you do asset:precompile, minify runs automatically. Note that this will overwrite the existing path. The following tasks can also be done independently.

```
$ rails assets_minify:compress
```

## Development

This gem minifies js, css files under Rails.application.config.output_path with yui or terser.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/newsdict/assets-minify-rails.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
