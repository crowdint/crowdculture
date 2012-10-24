class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :feed_id
      t.string :img_url
      t.date :published_date
      t.string :title

      t.timestamps
    end
  end
end
