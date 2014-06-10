# == Schema Information
#
# Table name: words_clouds
#
#  id         :integer          not null, primary key
#  words      :string(255)      default([]), is an Array
#  word       :string(255)
#  frequency  :integer
#  created_at :datetime
#  updated_at :datetime
#

class WordsCloud < ActiveRecord::Base
  belongs_to :journal_entry

#populates a word cloud hash and the frequency of each word
  def populate(word_cloud)
    word_array = word_cloud[0].flatten

    word_frequency = Hash.new

    word_array.each do |word|
      if word_frequency[word] == nil
        word_frequency[word] = 1
      else
        word_frequency[word] += 1
      end
    end
    
    word_frequency

  end




end
