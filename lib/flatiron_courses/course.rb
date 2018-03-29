class FlatironCourses::Course
  
  attr_accessor :name, :duration, :summary
  
  def initialize(name=nil, duration=nil)
    @name = name
    @duration = duration
  end
  
  def self.all
    @@all ||= scrape_flatiron_courses
  end
  