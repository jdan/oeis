require "oeis/version"
require 'nokogiri'
require 'open-uri'

module OEIS
  # Your code goes here...
  class OEISParser

    BASE_URL = 'http://oeis.org/search?q='

    attr_accessor :id, :title, :sequence

    def initialize(ls)
      url = BASE_URL + ls.join(',')
      begin
        doc = Nokogiri::HTML(open(url))
      rescue SocketError
        puts 'Connection could not be established. Check your internet connection.'
      end

      first_result = doc.css('table table:eq(2)').first
      info = first_result.css('tr:eq(3) table > tr > td > a').first

      if info.nil?
        puts 'No sequence found.'
        return nil
      end

      @id = info.attributes['href'].value[1..-1]
      @title = info.attributes['title'].value

      digits = first_result.css('tr:eq(4) table tr tt').text.split(', ')
      @sequence = digits.map &:to_i
    end

    def to_s
      "#{@id}: #{@title}"
    end

  end

  def self.search(ls)
    OEISParser.new(ls)
  end
end
