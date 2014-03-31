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


end
