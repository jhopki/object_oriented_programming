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


product = Product.new("music_cd", 14.99)
puts product.sales_tax
puts product.total_price
imports = Imported.new("bottle of perfume", 27.99)
puts imports.sales_tax
puts imports.total_price
exempt_item = Exempt.new("chocolate bar", 0.85)
puts exempt_item.sales_tax
puts exempt_item.total_price
exemptimport = ExemptImport.new("box of chocolates", 11.25)
puts exemptimport.sales_tax
puts exemptimport.total_price

