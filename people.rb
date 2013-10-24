class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def greeting
    puts "Hi, my name is #{@name}."
  end
end

class Student < Person
  def learn
    puts "I get it!"
  end
end

class Instructor < Person
  def teach 
    puts "Everything in Ruby is an Object"
  end
end

instructor = Instructor.new("Chris")
instructor.greeting
student = Student.new("Cristina")
student.greeting
instructor.teach
student.learn
student.teach 
#calling teach on the student doesn't work because the teach method is only defined 
# in the instructor class, not the student or the Person class
