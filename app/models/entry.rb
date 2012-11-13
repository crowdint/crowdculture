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
  attr_accessible :feed_id, :img_url, :published_date, :title, :entry_id, :content_type, :avatar, :box_size
  belongs_to :feed
  validates :entry_id, presence: true, uniqueness: { case_sensitive: false }
  validates :feed_id, :published_date, :title, :content_type, presence: true

  default_scope order: 'entries.published_date DESC'

  has_attached_file :avatar, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

    class << self
      def check_size(n)
        entries = Entry.find(:all, :order => "id desc", :limit => n)
        entries.each do |entry|
          if entry.avatar_file_name != nil
            avatar = entry.avatar
            photo_path = (avatar.options[:storage] == :s3) ? avatar.url : avatar.path
            geo ||= Paperclip::Geometry.from_file(photo_path)
            if geo.width / geo.height > 1.8 
              entry.update_attribute(:box_size, 2)
            end
          end
        end
      end
    end
end
