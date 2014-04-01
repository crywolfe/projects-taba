class SamplePhrasesController < ApplicationController

	def index
		@sample_phrases = SamplePhrase.all
		@moods = Mood.all
		binding.pry

	end

	def new
	end

	def create


	end

	def show
	end

	def edit
	end

end