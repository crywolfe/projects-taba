class JournalEntry < ActiveRecord::Base
	belongs_to :user

	#create method to separate date from time
	def self.separate_date_from_time
		journal_entries = JournalEntry.all

		require "date"

		unparsed_date = journal_entries.created_at
		unparsed_date.parse(journal_entries.created_at)




	end


end