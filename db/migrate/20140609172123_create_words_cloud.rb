class CreateWordsCloud < ActiveRecord::Migration
  def change
    create_table :words_clouds do |t|
      t.string :words, array: true, default: []
      t.string :word
      t.integer :frequency
      t.timestamps
    end
  end
end
