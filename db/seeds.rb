DISH_TYPES = ["breakfast ","lunch","brunch","dinner","dessert","snack","drink"]
PASSWORD = "food"

User.destroy_all
Provider.destroy_all

User.create(
  user_name: "root",
  full_name: "root",
  email: "root@i.com",
  password: PASSWORD
)

5.times.each do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name

  User.create(
    user_name: first_name,
    full_name: first_name+last_name,
    email: "#{first_name.downcase}.#{last_name.downcase}@eatsfinder.com",
    password: PASSWORD
  )
end

users = User.all
puts "Created #{users.count} users"

20.times.each do 
  provider_name = Faker::Name.name
  user = users.sample

  p = Provider.create(
    name: provider_name,
    email: "#{provider_name.parameterize}@eatsfinder.com",
    website:"http://#{provider_name.parameterize}.com",
    description: Faker::Friends.character,
    phone_number: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.full_address,
    user: user
  )
  if p.valid?
    rand(0..10).times.each do
      d = Dish.create(
        provider: p,
        name: Faker::Food.dish,
        dish_type: DISH_TYPES.sample,
        description: Faker::Food.spice,
        price: rand(4...35),
        user: user
      )
    end
  end

end

providers = Provider.all
dishes = Dish.all
puts "Created #{providers.count } providers"
puts "Created #{dishes.count } dishes"
