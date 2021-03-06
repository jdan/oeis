require "oeis/version"
require 'nokogiri'
require 'open-uri'

module OEIS
  class Parser

    BASE_URL = 'http://oeis.org/search?q='

    attr_accessor :id, :title, :sequence

    def initialize(ls)
      url = BASE_URL + ls.join(',')
      doc = Nokogiri::HTML(open(url))

      first_result = doc.css('table table:eq(2)').first
      info = first_result.css('tr:eq(3) table > tr').first

      if info.nil?
        puts 'No sequence found.'
        return nil
      end

      @id = info.css('td:eq(1) > a').text.strip
      @title = info.css('td:eq(3)').text.strip

      digits = first_result.css('tr:eq(4) table tr tt').text.split(', ')
      @sequence = digits.map &:to_i
    end

    def to_s
      "#{@id}: #{@title}"
    end

  end

  def self.search(ls)
    OEIS::Parser.new(ls)
  end
end
