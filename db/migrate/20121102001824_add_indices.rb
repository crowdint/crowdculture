class AddIndices < ActiveRecord::Migration
  def up
    add_index :entries, :entry_id, name: "entries_id_index", unique: true
    add_index :entries, :title, name: "entries_title_index", unique: true
    add_index :entries, :published_date, name: "entries_published_date_index"
  end

  def down
    remove_index :entries, :entry_id
    remove_index :entries, :title
    remove_index :entries, :published_date
  end
end
