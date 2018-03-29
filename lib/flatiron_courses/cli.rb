class FlatironCourses::CLI
  
  def call
    start
  end
  
  def list
    puts "See courses offered by the Flatiron School."
    puts ""
    FlatironCourses::Course.all.each.with_index(1) do |course, i |
      puts "#{i}. #{course.name}"
    end
  end
  
  
  def show_course(course)
    puts "#{course.name}"
    puts "#{course.duration}"
    puts "#{course.description}"
  end
  
  def start
    list
    input = nil 
    while input != "exit"
    
    puts "Which course would you like more info on? (Name or Number)"
    puts "Type 'list' to see all courses."
    puts "Type 'exit' to close the app."
    
    input = gets.strip
    if input == "list"
      list 
    elsif input.to_i == 0
      if course = FlatironCourses::Course.find_by_name(input)
        show_course(course)
      end
    elsif input.to_i > 0
    if course = FlatironCourses::Course.find(input.to_i)
      show_course(course)
    end
  end
end
puts "Program ended"
end
end 
    