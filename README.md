# Norikra::Querydump::Format

Formatter for norikra-client query dump and sync.

## Installation

$ gem install norikra-querydump-format

## Usage

Format as text norikra query dump.

```
$ norikra-client query dump | norikra-querydump-format -i json > dump.txt
```

Format as json from dump text.

```
$ norikra-querydump-format -i text < dump.txt | norikra-client query sync
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/norikra-querydump-format.

