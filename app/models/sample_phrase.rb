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


	def extract_each_phrase(journal_entry)

		# define and initialize empty array
		phrase_array = []
		# bring in 'journal entry body' string
		# split on .!? and \n
		journal_entry.split(/. ! ? \n /)

		# push into array
		# now go to views
		# iterate over each element
		# render on view

	end


end
