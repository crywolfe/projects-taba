require "spec_helper"

describe SamplePhrase do

	it "should return a 1 element array from a single sentence string" do
		input = "What a great day!"
		output = [input]

		expect(SamplePhrase.extract(input)).to eq(output)
	end


	it "should return a 2 element array from a two sentence string" do
		input = "What a great day! I had a great time"
		output = ["What a great day!", "I had a great time"]

		expect(SamplePhrase.extract(input)).to eq(output)
	end

end