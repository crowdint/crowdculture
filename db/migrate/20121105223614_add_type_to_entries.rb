class AddTypeToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :content_type, :string
    add_index :entries, :content_type
  end
end
