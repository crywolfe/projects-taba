# == Schema Information
#
# Table name: journal_entries
#
#  id         :integer          not null, primary key
#  body       :string(255)
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

		# journal_entry = "This is a sentence.  I am feeling great!  What do you think?  Yeah :)  Next time."
		#start with ! as one of many punctuations
		delimiter = /(\. |\.|! |\? |\.\.\.)/
		#split on the delimiter
		phrase = body.split(delimiter)
		# handle phrase if array elements are greater than one
		if phrase.size > 1
			phrase.each do |n|
				binding.pry
				if n == phrase.length
				end
				# TODO: use each_with_index which takes two block args ||
				#need length limitation
				# s = phrase.index(n) + 1
				# TODO: exit if n is equal to phrase.length
				phrase[phrase.index(n)] << phrase[phrase.index(n)+1]
				phrase.slice!(phrase.index(n)+1)
				# phrase[phrase.index(n)] += delimiter
			end
			#return array of phrases on method call
		end
		phrase

	end

end
