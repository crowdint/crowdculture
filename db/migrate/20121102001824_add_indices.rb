class AddIndices < ActiveRecord::Migration
  def up
    add_index :entries, :entry_id, name: "entries_id_index", unique: true
    add_index :entries, :title, name: "entries_title_index"
    add_index :entries, :published_date, name: "entries_published_date_index"
  end

  def down
    remove_index :entries, name: "entries_id_index"
    remove_index :entries, name: "entries_title_index"
    remove_index :entries, name: "entries_published_date_index"
  end
end
