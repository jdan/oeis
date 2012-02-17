require "oeis/version"
require 'nokogiri'
require 'open-uri'

module OEIS
  # Your code goes here...
  class OEIS
    
    BASE_URL = 'http://oeis.org/search?q='
    
    attr_accessor :id, :title, :sequence
    
    def initialize(l)
      url = BASE_URL + l.join(',')
      doc = Nokogiri::HTML(open(url))
      
      first_result = doc.css('table table:eq(2)').first
      info = first_result.css('tr:eq(3) table > tr > td > a').first
      
      @id = info.attributes['href'].value[1..-1]
      @title = info.attributes['title'].value
      
      digits = first_result.css('tr:eq(4) table tr tt').text.split(', ')
      @sequence = digits.map { |a| a.to_i }
    end
    
  end
  
  def self.Search(l)
    OEIS.new(l)
  end
end
