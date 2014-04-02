class SamplePhrasesController < ApplicationController

	def index
		@sample_phrases = SamplePhrase.all
		@moods = Mood.all

	end

	def new
	end

	def create


	end

	def show
		@sample_phrases = JournalEntry.SamplePhrase.all
		@moods = Mood.all
		@sample_phrase
	end

	def edit
	end

end