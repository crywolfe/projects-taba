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
      sentences = extract_sentences()
      create_sample_phrases(sentences)
      create_csv(sentences)
  end


  def create_sample_phrases(phrases)
    #take each element of the phrase array and enter it into the SamplePhrase table
    phrases.each do |phrase|
      sample = SamplePhrase.create(:phrase => phrase)
      self.sample_phrases << sample
    end
  end

  def create_csv(phrases)
    #take the phrase array and output it to a csv file.
    CSV.open('sample_phrases.csv', 'wb') do |csv|
      csv << phrases
    end
  end
end
