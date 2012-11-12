class AddBoxSizeToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :box_size, :integer, default: 1
  end
end
