# Norikra::Querydump::Format

A formatter for norikra-client query dump and sync.

## Installation

```
$ gem install norikra-querydump-format
```

## Usage

```
$ norikra-querydump-format -i (text|json) [inputfile]
```

Format norikra query dump as a text.

```
$ norikra-client query dump | norikra-querydump-format -i json > dump.txt
```

Sync queries from a text to norikra.

```
$ norikra-querydump-format -i text < dump.txt | norikra-client query sync
```

## Examples

An example output of `norikra-client query dump`.

```json
[
  {
    "name": "query1",
    "group": null,
    "suspended": false,
    "targets": [
      "foo"
    ],
    "expression": "SELECT count(*) FROM\n  foo.win:time_batch(1 min)\n"
  },
  {
    "name": "query2",
    "group": null,
    "suspended": false,
    "targets": [
      "bar"
    ],
    "expression": "SELECT count(*) FROM bar.win:time_batch(1 min)\n"
  }
]
```

`-i json` converts a json to text below.

```sql
-- QUERY:{"name":"query1","group":null,"suspended":false,"targets":["foo"]}
SELECT count(*) FROM
  foo.win:time_batch(1 min)

-- QUERY:{"name":"query2","group":null,"suspended":false,"targets":["bar"]}
SELECT count(*) FROM bar.win:time_batch(1 min)

```

`-i text` converts a text to json.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/norikra-querydump-format.

## See also

- [Norikra](https://norikra.github.io/)

## Copyright

(c) 2015- FUJIWARA Shunichiro

## License

MIT License
