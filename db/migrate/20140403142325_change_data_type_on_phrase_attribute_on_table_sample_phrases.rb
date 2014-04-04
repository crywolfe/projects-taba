class ChangeDataTypeOnPhraseAttributeOnTableSamplePhrases < ActiveRecord::Migration
  def change
  	change_table :sample_phrases do |t|
  		t.change :phrase, :text
  	end
  end
end
