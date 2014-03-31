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


	def self.extract(journal_entry)
		delimiter = "! "
		journal_entry_split = journal_entry.split(delimiter)
		if journal_entry_split.size > 1
			journal_entry_split[0] += "!"

		end

		journal_entry_split


		# define and initialize empty array
	
		# now go to views
		# iterate over each element
		# render on view

	end



end
