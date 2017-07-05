# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

2.times do
	User.create({frist_name: Faker::Name.name,
				last_name: Faker::Name.name})
end

15.times do
  MakeupItem.create({name: Faker::Name.name,
              description: Faker::Name.name,
              price: Faker::Number.decimal(2),
              average_rating: Faker::Number.number(1),
              filepicker_url: Faker::Avatar.image("icecream", "50x50"),
              user_id: 1})
end