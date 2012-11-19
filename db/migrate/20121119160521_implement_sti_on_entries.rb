class ImplementStiOnEntries < ActiveRecord::Migration
  def up
    add_column :entries, :content_url, :string
    add_column :entries, :type, :string
  end

  def down
    remove_column :entries, :content_url
    remove_column :entries, :type
  end
end
