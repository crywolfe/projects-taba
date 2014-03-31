require "spec_helper"

describe SamplePhrase do

	it "should return a 1 element array from a single sentence string" do
		input = "What a great day!"
		output = [input]

		expect(SamplePhrase.extract(input)).to eq(output)


	end


end