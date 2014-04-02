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

		# use delimiter to set reg ex to split on... continue to add to this.
		delimiter = /(\. |\.|! |\? |\.\.\.)/
		#split on the delimiter
		phrase = body.split(delimiter)

		# handle phrase if array elements are greater than one
		if phrase.size > 1
			phrase.map do |n|
				# exit if n is equal to phrase.last
				if phrase.last == n
					break
				end #if
				# TODO: use each_with_index which takes two block args ||
				#need length limitation
				phrase[phrase.index(n)] << phrase[phrase.index(n)+1]
				phrase.slice!(phrase.index(n)+1)

			end #phrase.map do
		end #if phrase
			#return the phrase array
		phrase

		#take each element of the phrase array and enter it into the SamplePhrase table
		## NOTE:  DO I NEED THIS???  NOT SURE I NEED TO PERSIST THIS DATA... I JUST NEED TO CREATE A CSV FILE... ALTHOUGH PERSISTING THE DATA WOULD BE HELPFUL TO HAVE FOR EACH USER... THIS MEANS I NEED TO NEST ROUTE IT...
		phrase.each do |n|
			SamplePhrase.create(:phrase => n)
		end

		#take the phrase array and output it to a csv file.
		CSV.open("sample_phrases.csv", "wb") do |csv|
			csv << phrase
		end

	end
end
