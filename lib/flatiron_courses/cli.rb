class FlatironCourses::CLI
  
  def call
    FlatironCourses::Scraper.new.scrape_flatiron
    puts "See classes offered by the Flatiron Coding School."
    start
  end
  
  def start
    
    puts ""
    puts "what number courses would you like to see? 1-5, 6-10, 11-15"
    input = gets.strip.to_i
    
    FlatironCourses::Scraper.scrape_flatiron(input)
    
    puts ""
    puts "Which course would you like more info on?"
    input = gets.strip
    
    course = FlatironCourses::Course.find(input.to_i)
    
    show_courses(course)
    
    puts ""
    puts "Would you like to see another restaurant? Enter Y or N"
    
    input = gets.strip.downcase
    if input == "y"
      start
    elsif input == "n"
    puts ""
    puts "Thank you."
    exit
  else
    puts "Please type 'Y' or 'N'."
    start
  end
  
      
    
  
    
  def list
    puts "See courses offered by the Flatiron School."
    puts ""
    FlatironCourses::Course.all.each.with_index(1) do |course, i|
      
      puts "#{i}. #{course.name}"
    end
  end
  
  
  def show_course(course)
    puts "#{course.name}"
    puts "#{course.duration}"
    puts "#{course.summary}"
  end
  
  
  def show_courses(from_number)
    puts ""
    puts " Courses #{from_number} through #{from_number+4}"
    puts ""
    
    
    
    
    # 1 - 5, more 6-10, etc...