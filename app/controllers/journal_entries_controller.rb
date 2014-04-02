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
#if validations pass save and redirect... if not render new with error.
		if @journal_entry.save
			redirect_to(user_journal_entries_path)
    else
    	# flash[:error] = "You made an error."
      render :new
    end
	end

	def show

		@journal_entry = JournalEntry.find_by(id: params[:id])
		@journal_entry.extract
		# redirect_to(user_journal_entry_sample_phrases_path([current_user, @journal_entry]))

		#need object for user and 
		# OR
		# redirect_to([:show, current_user, @journal_entry])
		# redirect_to("/users/<%= current_user.id %>/journal_entries/<%= @journal_entry.id %>/sample_phrases")
		@sample_phrases = SamplePhrase.all
		@moods = Mood.all
		render "sample_phrases/show"


	end

### I attempted to use strong params but I couldn't figure out the proper syntax.
	# private

	# def journal_entry_params
	# 	params.require(:journal_entries).permit(
	# 		:body
	# 	)
	# end

end