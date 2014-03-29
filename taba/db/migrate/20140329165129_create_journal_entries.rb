class CreateJournalEntries < ActiveRecord::Migration
  def change
    create_table :journal_entries do |t|
    	t.string :body
    	t.timestamps
    end
  end
end
