# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = User.new({
  name: 'Piotr Jeszke',
  email: 'admin@przedluzanie-wlosow.info',
  password: 'admin1234',
  password_confirmation: 'admin1234',
  admin: true
  })

justyna = User.new({
  name: 'Justyna Pasławska',
  email: 'justyna@przedluzanie-wlosow.info',
  password: 'justyna1234',
  password_confirmation: 'justyna1234',
  admin: false
  })

ola = User.new({
  name: 'Aleksandra Kierzyk',
  email: 'ola@przedluzanie-wlosow.info',
  password: 'ola1234',
  password_confirmation: 'ola1234',
  admin: false
  })

krzysiek = User.new({
  name: 'Krzysztof Pawłowski',
  email: 'krzysztof@przedluzanie-wlosow.info',
  password: 'krzysiek1234',
  password_confirmation: 'krzysiek1234',
  admin: false
  })

admin.save
justyna.save
ola.save
krzysiek.save
