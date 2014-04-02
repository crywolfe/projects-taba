class ChangeDatatypeOnBodyAttribueOnTableJournalEntries < ActiveRecord::Migration
  def change
  	change_table :journal_entries do |t|
  		t.change :body, :text
  	end
  end
end
