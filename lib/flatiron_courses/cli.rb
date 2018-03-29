class FlatironCourses::CLI
  
  def call
    start
  end
  
  def list
    puts "See courses offered by the Flatiron School."
    puts ""
    FlatironCourses::COurse.all.each.with_index(1) do |course, i |
      puts "#{i}. #{course.name}"
    end
  end
  