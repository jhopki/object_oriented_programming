
class Rover
  
  def initialize(init_str)
    @init_str = init_str.split(" ")
    @start_position = @init_str[0,2]
    @init_heading = @init_str[2]
  end
  def initial_heading
    @init_heading
  end

  def starting_position
    @start_position
  end
  def move_one(direction)
    if direction == "N"
      @start_position[1] += 1
    elsif direction == "E"
      @start_position[0] += 1
    elsif direction == "W" 
      @start_position[0] -= 1
    elsif direction == "S" 
      @start_position[1] -= 1
    else
      puts "error"      
    end
  end
  
  
  def turn(heading, direction_change)
    # if direction_change == "L"
    # directions = ["N","E","S","W"]
      # new_heading = directions[x-1]
    # elsif direction_change == "R"
      # new_heading = directions[x+1]
    # end
    #or
    if direction_change == "L"
      new_heading = "W" if heading == "N"
      new_heading = "S" if heading == "W"
      new_heading = "E" if heading == "S"
      new_heading = "N" if heading == "E"
    end
    if direction_change == "R"
      new_heading = "E" if heading == "N"
      new_heading = "N" if heading == "W"
      new_heading = "W" if heading == "S"
      new_heading = "S" if heading == "E"
    end
  end

end

class Plateau #??? maybe not needed

  def initialize(x,y)
    @x = x
    @y = y
  end
  def create_grid

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
rover_route = "LMLMLMLMM"
puts rover1.initial_heading
puts rover1.starting_position
