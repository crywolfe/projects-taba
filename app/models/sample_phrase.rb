# == Schema Information
#
# Table name: sample_phrases
#
#  id               :integer          not null, primary key
#  phrase           :text
#  created_at       :datetime
#  updated_at       :datetime
#  journal_entry_id :integer
#

class SamplePhrase < ActiveRecord::Base
	belongs_to :journal_entry
	belongs_to :mood


  def save_extracted_phrases_with_moods
    phrases = @sample_phrases
  end


end
