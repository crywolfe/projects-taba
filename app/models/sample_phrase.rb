class SamplePhrase < ActiveRecord::Base
	belongs_to :journal_entry


	def extract_each_phrase

		# define and initialize empty array
		phrase_array = []
		# bring in 'body' string
		# split on .!?
		# push into array
		# now go to views
		# iterate over each element
		# render on view

	end


end
