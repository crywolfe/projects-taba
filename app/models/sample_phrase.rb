# == Schema Information
#
# Table name: sample_phrases
#
#  id                 :integer          not null, primary key
#  phrase             :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  journal_entries_id :integer
#

class SamplePhrase < ActiveRecord::Base
	belongs_to :journal_entry
	belongs_to :mood

# 	def fake_method
# # define and initialize empty array
# 		phrase_array = []
# 		# bring in 'journal entry body' string
# 		# split on .!? and \n
# 		# journal_entry.split(/. ! ? \n /)

# 		phrase_chars = journal_entry[:body](reg ex /  /)
# 		phrase_chars.each do |char|
# 			phrase_hash = {
# 				phrase: char.split(reg ex / /),
# 			}
# 		# push hash into array

# 		phrase_array << phrase_hash

# 		# now go to views
# 		# iterate over each element
# 		# render on view
# 	end

	# end

	def extract(journal_entry)
		# journal_entry = "This is a sentence.  I am feeling great!  What do you think?  Yeah :)  Next time."
		#start with ! as one of many punctuations
		delimiter = /(\. |\.|! |\? |\...)/
		#split on the delimiter
		phrase = journal_entry.split(delimiter)
		# handle phrase if array elements are greater than one
		if phrase.size > 1
			phrase.each do |n|
				#need length limitation
				# s = phrase.index(n) + 1
				phrase[phrase.index(n)] << phrase[phrase.index(n)+1]
				phrase.slice!(phrase.index(n)+1)
				# phrase[phrase.index(n)] += delimiter
			end

			# # take out the additional delimiter on the last array element.
			# phrase_chars = phrase[-1].chars
			# phrase_chars.pop
			# rejoined_phrase = phrase_chars.join
			# phrase[-1] = rejoined_phrase
		end

		#return array of phrases on method call
		phrase
	end
end
