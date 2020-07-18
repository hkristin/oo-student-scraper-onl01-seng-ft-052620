require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    index_page = Nokogiri::HTML(open(index_url))
    student_cards = @doc.css('.student-card'); 
    student_cards.each do |student_attributes|
      new_student = Student.create(
        student_attributes.css('.student-name').text,
        student_attributes.css('.student-location').text,
        student_attributes.css('a')[0].attributes["href"].value
      )
    end
    Student.all
  end

  def self.scrape_profile_page(profile_url)
    @doc = Nokogiri::HTML(open(profile_url))
    return_hash = {}
    
    social_media_arr = @doc.css('.social-icon-container')[0].css('a').each do |node|
      
     # binding.pry
    end
  end

end

