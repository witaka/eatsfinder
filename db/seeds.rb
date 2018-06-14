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

end

providers = Provider.all
puts "Created #{providers.count } providers"

