class CreateMoods < ActiveRecord::Migration
  def change
    create_table :moods do |t|
    	t.string :name
    	t.string :sample_phrase_id
    	t.timestamps
    end
  end
end
