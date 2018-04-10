require 'pry'
class FlatironCourses::Scraper
  
  def self.scrape_flatiron
    doc = Nokogiri::HTML(open("https://flatironschool.com/our-courses/"))
    
    
    courses = doc.search("ul.list.list--separators.list--separators--top.list--separators--color-grey-faint.list--spacing-flex-large li")
  
       courses.each do |new_course|
            course = FlatironCourses::Course.new
            course.name = new_course.search("div.heading.heading--level-2.heading--level-2--no-flex").text.strip
            course.duration = new_course.search("h6.heading.heading--level-6.heading--level-6--color-grey-dark.util__margin-ntxs").text.strip
            
            course.summary = new_course.search("div.text-block p").text.strip

 
    end
    
  end
  
end