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
		# @sample_phrases = SamplePhrase.new
		# @journal_entries = JournalEntry.all
		binding.pry

		@journal_entry = JournalEntry.find_by(id: params[:id])
		# @journal_entry.extract
		# redirect_to(user_journal_entry_sample_phrases_path([current_user, @journal_entry]))
		# redirect_to([:show, current_user, @journal_entry])
		# @sample_phrases = @journal_entry.extract
		@sample_phrases.save_extracted_phrases_with_moods
		redirect_to(user_journal_entries_path)
	end

	def show
		@sample_phrases = SamplePhrase.all
		@journal_entries = JournalEntry.all
		@moods = Mood.all
		@sample_phrase
		@google_predictions = "https://www.googleapis.com/prediction/v1.6/projects/414649711441/hostedmodels/sample.sentiment/predict"
	end

	def edit
	end

end