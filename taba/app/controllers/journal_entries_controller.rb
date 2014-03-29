class JournalEntriesController < ApplicationController

	def index
	end

	def new
	end

	def create
		@journal_entry = JournalEntry.create(
			:body => params[:body]
			)

		if @journal_entry.save
			redirect_to(journal_entry)
    else
      render :new
    end


	end

	# private

	# def journal_entry_params
	# 	params.require(:journal_entries).permit(
	# 		:body
	# 	)
	# end

end