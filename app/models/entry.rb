# == Schema Information
#
# Table name: entries
#
#  id                  :integer         not null, primary key
#  feed_id             :integer
#  content_url         :string(255)
#  published_date      :datetime
#  title               :string(255)
#  created_at          :datetime        not null
#  updated_at          :datetime        not null
#  entry_id            :string(255)
#  type                :string(255)
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  box_size            :integer         default(1)
#

class Entry < ActiveRecord::Base
  attr_accessible :feed_id, :content_url, :published_date, :title, :entry_id, :type, :avatar, :box_size
  belongs_to :feed
  validates :entry_id, presence: true, uniqueness: { case_sensitive: false }
  validates :feed_id, :published_date, :type, :title, presence: true
  
  validate do |entry|
    entry.errors[:type] << "must be a valid subclass of Entry" unless Entry.descendants.map{|klass| klass.name}.include?(entry.type)
  end

  default_scope order: 'entries.published_date DESC'

  after_create :print_info

  has_attached_file :avatar, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

    class << self
      def inherited(child)
        child.instance_eval do
          alias :original_model_name :model_name
          def model_name
            Entry.model_name
          end
        end
        super
      end

      def check_for_news(entries)
        news = []
        entries.each do |entry|
          Entry.entry_exists?(entry.entry_id) ? break : news<<entry
        end
        news
      end

      def entry_exists?(id)
        Entry.exists?(:entry_id => id)
      end
    end

    private 

      def print_info
        author = self.feed ? self.feed.author : 'somewhere'
        print "New #{self.type} from #{author} with title #{self.title} added \n"
      end
end
