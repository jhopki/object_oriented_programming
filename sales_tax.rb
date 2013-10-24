module Utils
  def self.round(price)
    return price if price % 5 ==0
    price + 5 - (price%5)
  end
end

class Product
  def initialize(name, price)
    @name = name
    @price = price*100
  end

  def tax_rate
    0.1
  end
  def sales_tax
    Utils::round(@price*tax_rate)
  end
  def total_price
    (@price + sales_tax)
  end

  def display_total
    item_total = total_price/100.0
    puts "#{@name}: #{item_total}"  
  end
end

class Imported < Product
  def tax_rate
    super + 0.05
  end
end

class Exempt < Product
  def tax_rate
    0
  end
end

class ExemptImport < Exempt
  def tax_rate
    super + 0.05
  end
end


# product = Product.new("music_cd", 14.99)
# puts product.sales_tax
# puts product.total_price
# imports = Imported.new("bottle of perfume", 27.99)
# puts imports.sales_tax
# puts imports.total_price
# exempt_item = Exempt.new("chocolate bar", 0.85)
# puts exempt_item.sales_tax
# puts exempt_item.total_price
# exemptimport = ExemptImport.new("box of chocolates", 11.25)
# puts exemptimport.sales_tax
# puts sprintf('%.2f',((exemptimport.total_price)/100.0))

# puts exemptimport.display_total(exempt_item.sales_tax)

list1 = {"book" => 12.49, "music CD" => 14.99, "chocolate bar" => 0.85}
list2 = {"imported box of chocolates" => 10.00, "imported bottle of perfume" => 47.50}
list3 = {"imported bottle of perfume" => 27.99, "bottle of perfume" => 18.99, "packet of headache pills" => 9.75, "imported box of chocolates" => 11.25}



def some_method(some_hash)
  exempt_items = ["book", "chocolate bar", "packet of headache pills"]
  imported_items = ["imported bottle of perfume"]
  exempt_imports = ["imported box of chocolates"]
  total_sales_tax = 0
  total_cost = 0
  some_hash.each do |k,v| 
    if exempt_items.include?(k)
      new_item = Exempt.new(k,v)
    elsif imported_items.include?(k)
      new_item = Imported.new(k,v)
    elsif exempt_imports.include?(k)
      new_item = ExemptImport.new(k,v)
    else
      new_item = Product.new(k,v)
    end
    
    total_sales_tax += new_item.sales_tax  
    total_cost += new_item.total_price
    new_item.display_total
  end

  puts "Sales Tax: #{sprintf('%.2f',total_sales_tax/100.0)}"
  puts "Total: #{total_cost/100.0}"
end

some_method(list1)
some_method(list2)
some_method(list3)

