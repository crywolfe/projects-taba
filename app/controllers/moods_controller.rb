class MoodsController < ApplicationController

	def index
		@moods = Mood.all
	end

	def new
	end

	def create
	end

	def show
	end

end