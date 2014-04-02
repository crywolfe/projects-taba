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
	admin: "f"
	)

new_journal_entry = JournalEntry.create(
	body: "I had such a wonderful time today!  LOL alot.  Great conversation with my wife.  I spent my whole day programming.\n  My lunch was ok, but dinner at Chipotle was +1!  Overall, today was above average.  The weather was decent.  I went to the top of a building to look at the view.  Wow!  The Empire State Building is quite fantastic.  I Love NYC!  Who wouldn't?  Great workout today too.  Another train ride, another day.  \n  Again?",
	user_id: "1"
	)

new_journal_entry2 = JournalEntry.create(
	body: "My day was awful.  It rained, rained and rained.\n  :(  \n What am I going to do?  Dinner was even worse!  The only saving grace was watching the Flatiron building.  So many people don't realize the significance of this building.  Just love it!  What would I rather have good weather and no Flatiron or inclement weather and Flatiron?\n  I should watch a movie. How about Lord of the Rings?  Love Frodo's book, 'There and Back Again'.",
	user_id: "2"
	)

new_journal_entry3 = JournalEntry.create(
	body: "Cool.  Cool!  COOL!  That is all I can say about today.",
	user_id: "1"
	)
###  Seed Moods Table with lots of data ###

moods_array = ["","Aggravated",
	"Alone",
	"Amused",
	"Angry",
	"Annoyed",
	"Excited",
	"Happy"]

moods_array.each do |mood|
	Mood.create(
		name: mood
		)
end


