class AddJournalEntriesIdToSamplePhrases < ActiveRecord::Migration
  def change
    add_column :sample_phrases, :journal_entries_id, :integer
  end
end
