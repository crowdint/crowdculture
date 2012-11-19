class ImplementStiOnEntries < ActiveRecord::Migration
  def up
    rename_column :entries, :img_url, :content_url
    rename_column :entries, :content_type, :type
  end

  def down
    rename_column :entries, :content_url, :img_url
    rename_column :entries, :type, :content_type
  end
end
