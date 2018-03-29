class FlatironCourses::Course
  
  attr_accessor :name, :duration, :summary
  
  def initialize(name=nil, duration=nil)
    @name = name
    @duration = duration
  end
  
  def self.all
    @@all ||= scrape_flatiron_courses
  end
  
  def self.find(id)
    self.all[id-1]
  end
  
  def self.find_by_name(name)
    self.all.detect do |c|
      c.name.downcase.strip == name.downcase.strip || c.name.split("(").first.strip.downcase == name.downcase.strip
    end
  end
  
  def self.scrape_flatiron_courses
    courses = []
    
    courses << self.scrape_flatiron
    
    courses
  end
  
  def scrape_flatiron
    doc = Nokogiri::HTML(open(https://flatironschool.com/our-courses/))
    
    course = self.new
    course.name = doc.search("div.heading heading--level-2 heading--level-2--no-flex").text.strip
    course.duration = doc.search("h6.heading heading--level-6 heading--level-6--color-grey-dark util__margin-ntxs").text.strip
    course.summary = doc.search("div.text-block p")
    
    course
  end
  
end