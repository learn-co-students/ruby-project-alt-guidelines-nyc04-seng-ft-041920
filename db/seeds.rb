require 'faker'

User.destroy_all
Courier.destroy_all
Order.destroy_all

5.times do 
    User.create(emailaddress: Faker::Internet.email, password: Faker::String.random(length: 8), name: Faker::Name.name, phonenumber: Faker::Number.number(digits: 10), address: Faker::Address.full_address)

    Courier.create(name: Faker::Name.name, phonenumber: Faker::Number.number(digits: 10))

    Order.create(order: Faker::Food.dish, user_id: User.all.sample.id, courier_id: Courier.all.sample.id)
end