class FlatironCourses::Course
  
  attr_accessor :name, :duration, :summary
  
  @@all = []
  
  def initialize(name=nil, duration=nil)
    @name = name
    @duration = duration
    
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.find(id)
    self.all[id-1]
  end
  
  def self.find_by_name(name)
    self.all.detect do |c|
      c.name.downcase.strip == name.downcase.strip || c.name.split("(").first.strip.downcase == name.downcase.strip
    end
  end

  
end