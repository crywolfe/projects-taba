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


  def save_extracted_phrases_with_moods
    binding.pry
    phrases = @sample_phrases
    create_csv(phrases)
  end

  

  def create_csv(phrases)

    phrases = @sample_phrases
    #take the phrase array and output it to a csv file.
    CSV.open('sample_phrases.csv', 'wb') do |csv|
      csv << phrases
    end

    #create taba_bucket folder in google cloud storage
    `gsutil mb gs://taba_bucket`
    #upload csv to google cloud storage using gsutil command
    `gsutil cp sample_phrases.csv gs://taba_bucket/sample_phrases.csv`
  end
end
