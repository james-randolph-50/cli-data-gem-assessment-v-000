class FlatironCourses::Course
  
  attr_accessor :name, :duration, :summary
  
  def initialize(name=nil, duration=nil)
    @name = name
    @duration = duration
  end
  
  def self.all
    @@all ||= scrape_flatiron
  end
  
  def self.find(id)
    self.all[id-1]
  end
  
  def self.find_by_name(name)
    self.all.detect do |c|
      c.name.downcase.strip == name.downcase.strip || c.name.split("(").first.strip.downcase == name.downcase.strip
    end
  end
  
  
  def self.scrape_flatiron
    doc = Nokogiri::HTML(open("https://flatironschool.com/our-courses/"))
    
    
    courses = doc.search("ul.list.list--separators.list--separators--top.list--separators--color-grey-faint.list--spacing-flex-large li")
      
  all_courses = []
  
       courses.each do |new_course|
            course = self.new
            course.name = new_course.search("div.heading.heading--level-2.heading--level-2--no-flex").text.strip
            course.duration = new_course.search("h6.heading.heading--level-6.heading--level-6--color-grey-dark.util__margin-ntxs").text.strip
            
            course.summary = new_course.search("div.text-block p").text.strip
            
    
      all_courses << course 
 
    end
    all_courses
  end
  
end