require 'spec_helper'

describe JournalEntry do

	# one, two and three sentences with one punctuation '!'
	describe '#extract' do
		it 'should return a 3 element array from a three sentence string' do
      entry = JournalEntry.new
      entry.body = 'What a great day! I had a great time! Simply wonderful!'
      output = ['What a great day! ', 'I had a great time! ', 'Simply wonderful!']
      sentences = entry.extract_sentences
      expect(sentences).to eq(output)
		end		

		it 'should return a 2 element array from a two sentence string' do
			entry = JournalEntry.new
			entry.body = 'What a great day! I had a great time!'
			output = ['What a great day! ', 'I had a great time!']
      sentences = entry.extract_sentences

			expect(sentences).to eq(output)
		end

		it 'should return a 1 element array from a single sentence string' do
			entry = JournalEntry.new
			entry.body = 'What a great day!'

			output = ['What a great day!']

			sentences = entry.extract_sentences
      expect(sentences).to eq(output)

		end

		# two sentences with two punctuations
		it 'should return a 2 element array from 2 sentences with 2 punctuations' do
			entry = JournalEntry.new
			entry.body = 'What a great day? Did I have a great time!'
			output = ['What a great day? ', 'Did I have a great time!']
			sentences = entry.extract_sentences
      expect(sentences).to eq(output)
    end
	end
end