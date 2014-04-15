# == Schema Information
#
# Table name: journal_entries
#
#  id         :integer          not null, primary key
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

class JournalEntry < ActiveRecord::Base
	belongs_to :user
	has_many :sample_phrases

	#create method to separate date from time
	# def separate_date_from_time
	# 	@journal_entry = JournalEntry.find_by
	# 	require "date"
	# 	unparsed_date = @journal_entries.created_at
	# 	parsed_date = unparsed_date.strftime("%A %m/%d %y")
	# 	return parsed_date

	# end
	def extract
			phrases = extract_sentences
			create_sample_phrases(phrases)
	end

	def extract_sentences
		# use delimiter to set reg ex to split on... continue to add to this.
		delimiter = /(\! |\? |(\.\.\.)|\. )/
		#split the journal entry body string on the delimiter
		phrases = body.split(delimiter)

		# handle phrase if array elements are greater than one
		if phrases.size > 1
			phrases.map do |n|
				# exit if n is equal to phrase.last
				if phrases.last == n
					break
				end #if
				# TODO: use each_with_index which takes two block args ||
				phrases[phrases.index(n)] << phrases[phrases.index(n)+1]
				phrases.slice!(phrases.index(n)+1)
			end #phrase.map do
		end #if phrase

		return phrases
	end

	def create_sample_phrases(phrases)
    #take each element of the phrase array and enter it into the SamplePhrase table
    phrases.each do |phrase|
      sample = SamplePhrase.create(:phrase => phrase)
      self.sample_phrases << sample
    end
  end

end
