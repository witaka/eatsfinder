DISH_TYPES = ["Breakfast ","Lunch","Brunch","Dinner","Dessert","Snack","Drink"]

Provider.destroy_all

20.times.each do 
  provider_name = Faker::Name.name

  p = Provider.create(
    name: provider_name,
    email: "#{provider_name.parameterize}@eatsfinder.com",
    website:"http://#{provider_name.parameterize}.com",
    description: Faker::Friends.character,
    phone_number: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.full_address 
  )
  if p.valid?
    rand(0..10).times.each do
      d = Dish.create(
        provider: p,
        name: Faker::Food.dish,
        dish_type: DISH_TYPES.sample,
        description: Faker::Food.spice,
        price: rand(4...35)
      )
    end
  end

end

providers = Provider.all
dishes = Dish.all
puts "Created #{providers.count } providers"
puts "Created #{dishes.count } dishes"
