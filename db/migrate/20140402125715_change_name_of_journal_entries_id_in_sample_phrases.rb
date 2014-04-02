class ChangeNameOfJournalEntriesIdInSamplePhrases < ActiveRecord::Migration
  def change
  	change_table :sample_phrases do |t|
  		t.rename :journal_entries_id, :journal_entry_id
  	end

  end
end
