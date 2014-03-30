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
			:body => params[:body]
			)

		if @journal_entry.save
			redirect_to(journal_entries_path)
    else
      render :new
    end
	end

	def show
		@journal_entry = JournalEntry.find_by(id: params[:id])
	
	end

### I attempted to use strong params but I couldn't figure out the proper syntax.
	# private

	# def journal_entry_params
	# 	params.require(:journal_entries).permit(
	# 		:body
	# 	)
	# end

end