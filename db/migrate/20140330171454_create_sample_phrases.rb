class CreateSamplePhrases < ActiveRecord::Migration
  def change
    create_table :sample_phrases do |t|
    	t.string :phrase
    	t.timestamps

    end
  end
end
