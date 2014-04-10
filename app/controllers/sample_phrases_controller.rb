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
		@google_predictions = "https://www.googleapis.com/prediction/v1.6/projects/414649711441/hostedmodels/sample.sentiment/predict"
	end

	def edit
	end

end