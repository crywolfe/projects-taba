# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

new_user = User.create(
	name: "Gerald",
	email: "gwolfe2007@gmail.com",
	password: "12345678",
	password_confirmation: "12345678",
	admin: "t"

	)

new_user2 = User.create(
	name: "John",
	email: "john@gmail.com",
	password: "12345678",
	password_confirmation: "12345678",
	admin: "t"

	)