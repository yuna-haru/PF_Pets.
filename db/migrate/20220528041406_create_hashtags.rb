class CreateHashtags < ActiveRecord::Migration[6.1]
  def change
    create_table :hashtags do |t|
      t.string :hashtag

      t.timestamps
    end
    add_index :hashtags, :hashtag, unique: true
  end
end
