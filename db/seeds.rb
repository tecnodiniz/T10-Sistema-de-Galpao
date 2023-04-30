# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Warehouse.create!(name: 'Santa Catarina', code: 'SDU', city:'Rio de Janeiro',area: 60_000,
    address: 'Av Galpão do Rio, 1000',
    cep: '12000-000',
    description: 'Perto do aéroporto')

Supplier.create!(corporate_name: 'ACME LTDA', brand_name:'ACME', registration_number:'44047449865',
    full_address:'Av das Palmas, 1200',city:'Bauru',state:'SP',email:'acme@yahoo.com.br')