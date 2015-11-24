require 'test_helper'

class Norikra::Querydump::FormatTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Norikra::Querydump::Format::VERSION
  end

  require 'json'
  require 'stringio'

  @@queries = [
    {
      "name"       => "query1",
      "group"      =>  nil,
      "suspended"  =>  false,
      "targets"    => ["foo"],
      "expression" =>  "SELECT count(*) FROM\n  foo.win:time_batch(1 min)\n"
    },
    {
      "name"       => "query2",
      "group"      => nil,
      "suspended"  => false,
      "targets"    => ["bar"],
      "expression" => "SELECT count(*) FROM bar.win:time_batch(1 min)\n"
    },
  ]

  @@text = <<-END_OF_TEXT
-- QUERY:{"name":"query1","group":null,"suspended":false,"targets":["foo"]}
SELECT count(*) FROM
  foo.win:time_batch(1 min)

-- QUERY:{"name":"query2","group":null,"suspended":false,"targets":["bar"]}
SELECT count(*) FROM bar.win:time_batch(1 min)

  END_OF_TEXT

  def test_json2text
    src = StringIO.new(@@queries.to_json)
    dest = StringIO.new("")
    Norikra::Querydump::Format.json2text(src, dest)
    dest.rewind
    assert_equal @@text, dest.string
  end

  def test_text2json
    src = StringIO.new(@@text)
    dest = StringIO.new("")
    Norikra::Querydump::Format.text2json(src, dest)
    dest.rewind
    result = JSON.parse(dest.string)
    assert_equal @@queries, result
  end

  def test_text2json_with_comment
    src = StringIO.new("-- comment here\n" + @@text)
    dest = StringIO.new("")
    Norikra::Querydump::Format.text2json(src, dest)
    dest.rewind
    result = JSON.parse(dest.string)
    assert_equal @@queries, result
  end

end
