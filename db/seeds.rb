# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
owner = Owner.where(name: "Fred").first_or_create
machine = owner.machines.where(location: "Community College").first_or_create
machine2 = owner.machines.where(location: "Swim Club").first_or_create
snack = machine.snacks.where(name: "Flaming Hot Cheetos", price: 2.50).first_or_create
snack2 = machine.snacks.where(name: "Pop Rocks", price: 1.50).first_or_create
snack3 = machine2.snacks.where(name: "Sunflower Seeds", price: 1.50).first_or_create
snack4 = machine2.snacks.where(name: "Chocolate Almonds", price: 2.50).first_or_create
