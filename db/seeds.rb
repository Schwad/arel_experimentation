# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
system("rails db:truncate_all")

100.times do
  Fish.create(
    fins: [true, false].sample,
    name: Faker::Name.name,
    age: rand(1..100)
  )
end

40.times do
  Candy.create(
    variety: ["Chocolate", "Gummy", "Hard", "Disgusting", "Salty"].sample,
    calories: rand(1..100),
  )
end

60.times do
  fish = FishCandy.create(
    fish: Fish.all.sample,
    candy: Candy.all.sample,
  )
  fish.destroy unless FishCandy.where(fish: fish.fish, candy: fish.candy).count == 1
end

100.times do
  Trinket.create(
    name: Faker::Name.name,
    fish: Fish.all.sample,
  )
end

150.times do
  Member.create(
    name: Faker::Name.name,
    trinket: Trinket.all.sample,
  )
end

puts "== All seeded! =="
