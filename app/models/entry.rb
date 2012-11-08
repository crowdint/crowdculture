# == Schema Information
#
# Table name: entries
#
#  id             :integer         not null, primary key
#  feed_id        :integer
#  img_url        :string(255)
#  published_date :date
#  title          :string(255)
#  created_at     :datetime        not null
#  updated_at     :datetime        not null
#  entry_id       :string(255)
#

class Entry < ActiveRecord::Base
  attr_accessible :feed_id, :img_url, :published_date, :title, :entry_id, :content_type
  belongs_to :feed
  validates :entry_id, presence: true, uniqueness: { case_sensitive: false }
  validates :feed_id, :published_date, :title, :content_type, presence: true

  default_scope order: 'entries.published_date DESC'
  
end
