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


		[journal_entry]

		# define and initialize empty array
	
		# now go to views
		# iterate over each element
		# render on view

	end



end
