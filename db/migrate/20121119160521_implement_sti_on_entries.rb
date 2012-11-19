class ImplementStiOnEntries < ActiveRecord::Migration
  def up
    rename_column :entries, :img_url, :content_url
    rename_column :entries, :content_type, :type
  end

  def down
    remove_column :entries, :content_url
    remove_column :entries, :type
  end
end
