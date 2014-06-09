# == Schema Information
#
# Table name: journal_entries
#
#  id         :integer          not null, primary key
#  body       :text
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
	def extract
			phrases = extract_sentences
			create_sample_phrases(phrases)
	end

	def extract_sentences
		# use delimiter to set reg ex to split on... continue to add to this.
		delimiter = /(\! |\? |(\.\.\.)|\. )/
		#split the journal entry body string on the delimiter
		phrases = body.split(delimiter)

		# handle phrase if array elements are greater than one
		if phrases.size > 1
			phrases.map do |n|
				# exit if n is equal to phrase.last
				if phrases.last == n
					break
				end #if
				# TODO: use each_with_index which takes two block args ||
				phrases[phrases.index(n)] << phrases[phrases.index(n)+1]
				phrases.slice!(phrases.index(n)+1)
			end #phrase.map do
		end #if phrase

		return phrases
	end

	def create_sample_phrases(phrases)
    #take each element of the phrase array and enter it into the SamplePhrase table
    phrases.each do |phrase|
      sample = SamplePhrase.create(:phrase => phrase)
      self.sample_phrases << sample
    end
  end

	def get_sentiment(phrases)
		@words_cloud = []
		@words_cloud[0] = []
		@words_cloud[1] = []
		phrases.each do |phrase|

			#need to gsub phrase space with + to make it encoding friendly
			encoded_phrase = phrase.gsub(" ", "+")
			user = "crywolfe"
			pwd = "rubi12_b"
			raw_response = `curl -s -d "User=#{user}&Pass=#{pwd}&Lang=Eng&ID=1&Detail=Detailed&Theme=Gen&OutFormat=JSON&Normalized=Yes&Text=#{encoded_phrase}" "http://svc8.bitext.com/WS_Nops_Val/Service.aspx"`
			jsonified_response = JSON.parse(raw_response)
			global_value = jsonified_response["data"][0]["global_value"]
			word_cloud = jsonified_response["data"][0]["details"][0]["valuers_norm"].split(",")
			# word_cloud_2 = jsonified_response["data"][0]["details"][0]["valuables_norm"].split(",")

			@words_cloud[0] << word_cloud
			# @words_cloud[0] << word_cloud_2
			@words_cloud[1] << global_value
		end #phrases
		@words_cloud

	end #get_sentiment


end
