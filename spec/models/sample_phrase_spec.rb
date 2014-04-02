require "spec_helper"

describe JournalEntry do

	# one, two and three sentences with one punctuation "!"

	it "should return a 1 element array from a single sentence string" do
		input = "What a great day!"
		output = [input]

		expect(input.extract).to eq(output)
	end

	it "should return a 2 element array from a two sentence string" do
		input = "What a great day! I had a great time!"
		output = ["What a great day!", "I had a great time!"]

		expect(JournalEntry.extract(input)).to eq(output)
	end

	it "should return a 3 element array from a three sentence string" do
		input = "What a great day! I had a great time! Simply wonderful!"
		output = ["What a great day!", "I had a great time!", "Simply wonderful!"]

		expect(JournalEntry.extract(input)).to eq(output)
	end

	it "should return a 4 element array from a four sentence string" do
		input = "What a great day! I had a great time! Simply wonderful! Really great!"
		output = ["What a great day!", "I had a great time!", "Simply wonderful!", "Really great!"]

		expect(JournalEntry.extract(input)).to eq(output)
	end

	# two sentences with two punctuations
	it "should return a 2 element array from a two sentence string with two punctuations" do
		input = "What a great day? Did I have a great time!"
		output = ["What a great day?", "Did I have a great time!"]

		expect(JournalEntry.extract(input)).to eq(output)
	end



end