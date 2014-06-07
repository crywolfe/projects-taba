class JournalEntriesController < ApplicationController

	def index
		@journal_entries = JournalEntry.all
	end

	def new
		@journal_entry = JournalEntry.new
	end

	# method to post new journal entries
	def create
		#assign to variable journal_entry a create to post.
		@journal_entry = JournalEntry.create(
			:body => params[:body],
			:user_id => current_user.id
			)
		@journal_entry.save
		redirect_to(user_journal_entries_path)
	end

	def show
		@journal_entry = JournalEntry.find_by(id: params[:id])
		# @journal_entry.extract
		# redirect_to(user_journal_entry_sample_phrases_path([current_user, @journal_entry]))
		# redirect_to([:show, current_user, @journal_entry])
		@sample_phrases = @journal_entry.extract

		@outcome = @journal_entry.get_sentiment(@sample_phrases)
		# @sample_phrases = SamplePhrase.all
		@moods = Mood.all
		render 'sample_phrases/show'
	end

### I attempted to use strong params but I couldn't figure out the proper syntax.
	# private

	# def journal_entry_params
	# 	params.require(:journal_entries).permit(
	# 		:body
	# 	)
	# end
end
