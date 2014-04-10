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
end
