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
		@sample_phrases = SamplePhrase.all
		@moods = Mood.all
	end

	def edit
	end

end