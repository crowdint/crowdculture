class AddSpecialTagToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :special_tag, :string, default: 'none'
  end
end
