# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "csv"
Product.where("id > 10").destroy_all

def insert_value_to_table(products)
  products.each do |p|
    category = Category.find_by(name: p["category"])
    next unless category&.valid?

    product = category.products.create(
      name:        p["name"],
      image_link:  p["image_link"],
      model_year:  rand(2011..2020),
      price:       p["reg_price"],
      sale_stat:   p["sale_stat"],
      sale_price:  p["sale_price"],
      description: Faker::Lorem.paragraph
    )
    puts "Invald product #{p['name']}" unless product&.valid?
    puts product.errors.messages.inspect unless product&.valid?
  end
end

csv_file = Rails.root.join("db/Hardwares.csv")
csv_data = File.read(csv_file)
hardwares = CSV.parse(csv_data, headers: true)

insert_value_to_table(hardwares)

csv_file = Rails.root.join("db/Softwares.csv")
csv_data = File.read(csv_file)
softwares = CSV.parse(csv_data, headers: true)

insert_value_to_table(softwares)

csv_file = Rails.root.join("db/Laptops.csv")
csv_data = File.read(csv_file)
laptops = CSV.parse(csv_data, headers: true)

insert_value_to_table(laptops)

csv_file = Rails.root.join("db/Miscs.csv")
csv_data = File.read(csv_file)
miscs = CSV.parse(csv_data, headers: true)

insert_value_to_table(miscs)

puts "Create #{Product.count}"
