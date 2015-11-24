require "norikra/querydump/format/version"

module Norikra
  module Querydump
    module Format
      require 'json'

      HEADER = '-- QUERY:'
      HEADER_REGEXP = Regexp.new("^#{HEADER}")

      def self.json2text(src=STDIN, dest=STDOUT)
        JSON.parse(src.read).each do |q|
          expression = q.delete('expression')
          dest.puts "#{HEADER}#{q.to_json}"
          dest.puts expression
          dest.puts ""
        end
      end

      def self.text2json(src=STDIN, dest=STDOUT)
        queries = []
        buf = []
        index = -1

        src.each do |line|
          next if line == "\n"
          if line =~ HEADER_REGEXP
            if index >= 0
              queries[index]['expression'] = buf.join('')
              buf.clear
            end
            line.gsub!(HEADER_REGEXP, '')
            line.gsub!(/ *$/, '')
            index = index + 1
            queries[index] = JSON.parse(line)
          elsif line =~ /^--/
            # skip comment line
            next
          else
            buf << line
          end
        end
        queries[index]['expression'] = buf.join('')
        dest.puts queries.to_json
      end

    end
  end
end
