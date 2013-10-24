
class Rover
  @@directions = ["N","E","S","W"]
  def initialize(init_str)
    @init_str = init_str.split(" ")
    @start_position = @init_str[0,2].map {|x| x.to_i}
    @heading = @init_str[2]
  end

  def starting_position
    @start_position
  end
  def read_route(route)
    route.split("")
  end

  def move_one(position)
    if @@directions[0] == "N"
      position[1] += 1
    elsif @@directions[0] == "E"
      position[0] += 1
    elsif @@directions[0] == "W" 
      position[0] -= 1
    elsif @@directions[0] == "S" 
      position[1] -= 1
    else
      puts "error"      
    end
    return position
  end
  
  
  # def turn(heading, direction_change)
    # if direction_change == "L"
      # new_heading = "W" if heading == "N"
      # new_heading = "S" if heading == "W"
    #   new_heading = "E" if heading == "S"
    #   new_heading = "N" if heading == "E"
    # end
    # if direction_change == "R"
    #   new_heading = "E" if heading == "N"
  #     new_heading = "N" if heading == "W"
  #     new_heading = "W" if heading == "S"
  #     new_heading = "S" if heading == "E"
  #   end
  # end
  def new_turn(direction_change)
    
    if direction_change == "R"
      @@directions.rotate!(-1)
    elsif direction_change == "L"
      @@directions.rotate!(1)
    else
      puts "error"
    end
      new_heading = @@directions[0]
  end
end
# INPUT AND OUTPUT
 
# Test Input:
# 5 5
# 1 2 N
# LMLMLMLMM
# 3 3 E
# MMRMMRMRRM
 
# Expected Output:
# 1 3 N
# 5 1 E

rover1 = Rover.new("1 2 N")
rover_route1 = "LMLMLMLMM"
rover2 = Rover.new("3 3 E")
rover_route2 = "MMRMMRMRRM"
# puts rover1.read_route(rover_route)
position = rover1.starting_position
new_position =[]
rover1.read_route(rover_route1).each do |x|
  if x == "M"
    new_position = rover1.move_one(position)
    puts new_position
  elsif x == "L" || x == "R"
    new_heading = rover1.new_turn(x)
    puts new_heading
  end
end

puts new_position.inspect

