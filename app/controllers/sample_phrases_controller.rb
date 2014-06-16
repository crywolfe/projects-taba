class SamplePhrasesController < ApplicationController

	def index
		@sample_phrases = SamplePhrase.all
		@moods = Mood.all
	end

	def new
		@sample_phrases = SamplePhrase.new
		@journal_entries = JournalEntry.all

	end

	def create
		@journal_entry = JournalEntry.find_by(params[:id])
		# @journal_entry.extract
		# redirect_to(user_journal_entry_sample_phrases_path([current_user, @journal_entry]))
		# redirect_to([:show, current_user, @journal_entry])
		# @sample_phrases = @journal_entry.extract
		# @sample_phrases.save_extracted_phrases_with_moods
		redirect_to(user_journal_entries_path)
	end

	def show
		binding.pry
		@journal_entry = JournalEntry.find(params[:journal_entry_id])
		@sample_phrases = @journal_entry.extract
		@outcome = @journal_entry.get_sentiment(@sample_phrases)
		neutral = -1
		@outcome[1].each do |index|
			if @outcome[1][index] == 0
				neutral += 1
			end
		end
		@average = (@outcome[1].inject(:+)/(@outcome[1].length - neutral))*10

		render 'sample_phrases/show'
	end


end
