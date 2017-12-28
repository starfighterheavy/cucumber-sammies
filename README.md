# Cucumber::Sammies

[![Code Climate](https://codeclimate.com/github/starfighterheavy/cucumber-sammies/badges/gpa.svg)](https://codeclimate.com/github/starfighterheavy/cucumber-sammies)
[![Dependency Status](https://gemnasium.com/starfighterheavy/cucumber-sammies.svg)](https://gemnasium.com/starfighterheavy/cucumber-sammies)
[![Gem Version](https://badge.fury.io/rb/cucumber-sammies.svg)](https://badge.fury.io/rb/cucumber-sammies)

![Cucumber Sandwhiches](./sammies.jpg)

Simple & tasty Cucumber step definitions for your Rails application. Many of these steps were originally created by [Spreewald](https://github.com/makandra/spreewald).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cucumber-sammies'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cucumber-sammies

## Usage

To use `cucumber-sammies` in your cucumber tests, add a line like this to your `features/support/env.rb` file.

```ruby
require 'cucumber/sammies/step_definitions/form_steps'
```

All the steps can be found in the [step_definitions directory](https://github.com/starfighterheavy/cucumber-sammies/tree/master/lib/cucumber/sammies/step_definitions)

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/starfighterheavy/cucumber-sammies. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Cucumber::Sammies project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/starfighterheavy/cucumber-sammies/blob/master/CODE_OF_CONDUCT.md).
