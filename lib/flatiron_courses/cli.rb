class FlatironCourses::CLI
  
  def call
    FlatironCourses::Scraper.scrape_flatiron
    
    start
  end
  
  def start
    
    puts "See classes offered by the Flatiron Coding School."
    puts ""
    sequence
  end
  
  def sequence
    puts "What number courses would you like to see? 1-5, 6-10, 11-15"
    input = gets.strip.to_i
    
    if input > FlatironCourses::Course.all.count
      puts "We don't have that many."
      sequence
    else
      show_courses(input)
    end
    
  end
    
  def more_info  
    puts ""
    puts "Which course would you like more info on?"
    input = gets.strip
    
    course = FlatironCourses::Course.find(input.to_i)
    
    show_course(course)
    
    puts ""
    puts "Would you like to see another course? Enter Y or N"
    
    input = gets.strip.downcase
    
    if input == "y"
      start
    elsif input == "n"
      puts ""
      puts "Thank you."
      exit
     else
      puts "Please type 'Y' or 'N'."
      sequence
  end
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
    FlatironCourses::Course.all[from_number-1, 5].each.with_index(from_number) do |course, index|
      puts "#{index}. #{course.name}"
    end
  end
end
    
    
    
    # 1 - 5, more 6-10, etc...