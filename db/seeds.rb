# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

50.times do
  Propertie.create(
    business_type: %w[rent adm].sample,
    value: rand(2000..4000),
    iptu: rand(400..700),
    condominium: rand(200..500),
    size: rand(80..130),
    rooms: rand(1..4),
    zone: %w[north west south east].sample,
    address: Faker::Address.street_name,
    number: Faker::Address.building_number,
    neighborhood: "Bairro",
    complement: %w[Casa Apartamento].sample,
    cep: Faker::Address.zip_code
  )
end

