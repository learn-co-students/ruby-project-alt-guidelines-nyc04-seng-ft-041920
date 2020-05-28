User.destroy_all
PlantList.destroy_all
MyPlant.destroy_all

5.times do 
    User.create(username: Faker::Name.first_name.downcase)
    PlantList.create(
        species: Faker::Food.vegetables.downcase, 
        moisture_use: ["high", "medium", "low"].sample, 
        watering_cycle: Faker::Number.within(range: 3..10) 
        )

    MyPlant.create(
    nickname: Faker::Artist.name.downcase,
    watered: Faker::Boolean.boolean, 
    watering_date: Faker::Date.in_date_period(month: 5).to_date,
    user_id: User.all.sample.id,
    plant_list_id: PlantList.all.sample.id,
    water_cycle:Faker::Number.within(range: 3..10)
    )
end