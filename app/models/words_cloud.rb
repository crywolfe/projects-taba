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

  def populate(word_cloud)
    word_cloud[0].flatten

  end


end
