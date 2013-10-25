
class Rover
  @@directions = ["N","E","S","W"]
  def initialize(init_str,route)
    @init_str = init_str.split(" ")
    @start_position = @init_str[0,2].map {|x| x.to_i}
    @heading = @init_str[2]
    @route = route
  end

  def starting_position
    puts @start_position
    @start_position
  end

  def read_route
    @route.split("")
  end

  def initial_heading
    if @heading != @@directions[0]
      index = @@directions.index(@heading)
      @@directions.rotate!(index)
      puts @@directions.inspect
    end
    return @@directions
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
      puts "moved south"
    else
      puts "error"      
    end
    puts "moved one"
    puts position.inspect
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
    
    if direction_change == "R" ||direction_change == "L"
      @@directions.rotate!(1)
    # elsif direction_change == "L"
      # @@directions.rotate!(1)
    else
      puts "error"
    end
      new_heading = @@directions[0]
      puts new_heading
      puts @@directions.inspect
      return new_heading
  end

  def move_rover
    position = starting_position
    new_position =[]
    new_heading = initial_heading
    puts new_heading

    read_route.each do |x|
      if x == "M"
        new_position = move_one(position)
        # puts new_position
      elsif x == "L" || x == "R"
        new_heading = new_turn(x)
        # puts new_heading
        puts "turned"
      end
    end
    puts "#{new_position} #{new_heading}"
  end
end

rover1 = Rover.new("1 2 N","LMLMLMLMM")
rover2 = Rover.new("3 3 E","MMRMMRMRRM")
rover1.move_rover
rover2.move_rover
# 3,3
# 4,3
# 5,3
# 5,2
# 5,1
# 4,1
# 5,1