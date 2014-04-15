# == Schema Information
#
# Table name: moods
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  sample_phrase_id :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

class Mood < ActiveRecord::Base
	has_many :sample_phrases

end
