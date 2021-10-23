# Redlog

Redlog is a fast and easy-to-use CLI for the Redmine project management tool.

Teams spend hours every week struggling to navigate around Redmine's clunky UI. With `redlog`, managing your Redmine issues can be as easy as running a simple command from your terminal.

Put new Ruby code in `lib/`. To experiment with that code, run `bin/console` for an interactive prompt.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'redlog'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install redlog

## Usage

If you're using redlog for the first time (or changing your user), set up redlog to with your username, password and redmine server url.
```
redlog setup
```

**Create issue and log time for issue**

`redlog '[title]' -l [log-time-in-hours]`

Example `redlog 'ABC-123: Fix XYZ drop-down not working' -l 1.5` => creates issue by the title "ABC-123: Fix XYZ drop-down not working" and logs 1.5 hours into it.

`redlog '[title]' -d [description] -l [log-time-in-hours]` => Add description (inside quotes)

### Defaults:

The default tracker for issue is `Bug`. Default assignee is `<< << Me >> >>`(your user). Default status is `In Progress`.

You can optionally change any of these using the flags `--[tracker: bug/feature/support/design/estimation]` `--assign [assignee-username]` and `-- [status:in-progress/resolved/feedback/closed]`

Example: `redlog "Add XYZ to ABC" -l 3 --feature --assign another_username --feedback`

### Changing default preferences

Redlog assumes some defaults to allow for a faster user experience. You can change these at any time by running `redlog preferences`


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/redlog.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
