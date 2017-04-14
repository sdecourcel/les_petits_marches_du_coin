require "open-uri"
require "yaml"

file = "db/test_data.yml"
sample = YAML.load(open(file).read)

FirmProduct.destroy_all
Product.destroy_all
Firm.destroy_all
MarketSupplier.destroy_all
Market.destroy_all
User.destroy_all
Location.destroy_all

#########  USERS  #########
puts 'Creating users...'

users = {} # slug => User
sample["users"].each do |user|
  users[user["slug"]] = User.new user.slice("email", "password")
  if users[user["slug"]].save!
    puts "id: #{users[user["slug"]].id} OK"
  else
    puts "ERROR #{users[user["slug"]].errors.full_messages} "
  end
end



#########  LOCATIONS  #########
puts 'Creating locations...'

locations = {} # slug => Location
sample["locations"].each do |location|
  locations[location["slug"]] = Location.new location.slice("address", "unique_name")
  if locations[location["slug"]].save!
    puts "id: #{locations[location["slug"]].id} OK"
  else
    puts "ERROR #{locations[location["slug"]].errors.full_messages} "
  end
end

#########  MARKETS  #########
puts 'Creating markets...'

markets = {} # slug => Market
sample["markets"].each do |market|
  user = users[market["user_slug"]]
  location = locations[market["location_slug"]]
  markets[market["slug"]] = Market.new market.slice("market_place", "week_day", "start_hour", "start_min", "stop_hour", "stop_min").merge(user: user).merge(location: location)
  if markets[market["slug"]].save!
    puts "id: #{markets[market["slug"]].id} OK"
  else
    puts "ERROR #{markets[market["slug"]].errors.full_messages} "
  end
end


#########  MARKET__SUPPLIERS  #########
puts 'Creating market_suppliers...'

sample["market_suppliers"].each do |market_supplier|
  user = users[market_supplier["user_slug"]]
  market = markets[market_supplier["market_slug"]]
  market_supplier_new = MarketSupplier.new({ user: user, market: market })
  if market_supplier_new.save
    puts "id: #{market_supplier_new.id} OK"
  else
    puts "ERROR #{market_supplier_new.errors.full_messages} "
  end
end

#########  FIRMS  #########
puts 'Creating firms...'

firms = {} # slug => Firm
sample["firms"].each do |firm|
  user = users[firm["user_slug"]]
  location = locations[firm["location_slug"]]
  firms[firm["slug"]] = Firm.new firm.slice("name", "description").merge(user: user).merge(location: location)
  if firms[firm["slug"]].save!
    puts "id: #{firms[firm["slug"]].id} OK"
  else
    puts "ERROR #{firms[firm["slug"]].errors.full_messages} "
  end
end

#########  PRODUCTS  #########
puts 'Creating products...'

products = {} # slug => Product
sample["products"].each do |product|
  parent = products[product["parent_slug"]] unless product["parent_slug"].nil?
  if parent.nil?
    products[product["slug"]] = Product.new product.slice("name", "category_level")
  else
    products[product["slug"]] = Product.new product.slice("name", "category_level").merge(parent: parent)
  end
  if products[product["slug"]].save!
    puts "id: #{products[product["slug"]].id} OK"
  else
    puts "ERROR #{products[product["slug"]].errors.full_messages} "
  end
end

#########  FIRM_PRODUCTS  #########
puts 'Creating firm_products...'

sample["firm_products"].each do |firm_product|
  product = products[firm_product["product_slug"]]
  firm = firms[firm_product["firm_slug"]]
  firm_product_new = FirmProduct.new ({ firm: firm, product: product })
  if firm_product_new.save!
    puts "id: #{firm_product_new.id} OK"
  else
    puts "ERROR #{firm_product_new.errors.full_messages} "
  end
end

puts 'Finished!'
