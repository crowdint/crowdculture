class AddAvatarToEntries < ActiveRecord::Migration
  def change
    add_attachment :entries, :avatar
  end
end
