class ChangePublishedDateType < ActiveRecord::Migration
  def up
    change_column :entries, :published_date, :datetime
  end

  def down
    change_column :entries, :published_date, :date
  end
end
