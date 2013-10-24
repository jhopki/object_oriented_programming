#compute distance along a certain route
#number of different routes between two towns
#shortest route between two towns

class TrainRoute
  @@graph = {:AB => 5, :BC => 4, :CD => 8, :DC => 8, :DE => 6, :AD => 5, :CE => 2, 
      :EB => 3, :AE => 7}
  
  def initialize(route)
    @route = route
  end

  def calc_total_dist
    total_dist = 0
    @route.each do |x| 
      return puts "NO SUCH ROUTE" if @@graph[x] == nil 
      total_dist += @@graph[x]
      end
    puts total_dist
  end
end

route1 = [:AB, :BC]
route2 = [:AD]
route3 = [:AD, :DC]
route4 = [:AE, :EB, :BC, :CD]
route5 = [:AE, :ED]

all_routes = [route1,route2, route3, route4, route5]
#or do I give it route1 = A-B-C and have to figure out subroutes from there?

all_routes.each do |x|
  new_route = TrainRoute.new(x)
  new_route.calc_total_dist
end

























