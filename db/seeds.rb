# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Gender.create!(name: "Masculino")
Gender.create!(name: "Feminino")

User.create!(email: 'user@example.com',
            password: 'changeme',
            fullname: "User Example",
            cpf: '12345678',
            gender: Gender.first,
            phone: '849999999999',
            birthday: '10/10/2000'
            )

Category.create!(name: "Jogos")
Category.create!(name: "Computadores")
