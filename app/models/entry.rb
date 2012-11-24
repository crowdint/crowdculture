# == Schema Information
#
# Table name: entries
#
#  id                  :integer         not null, primary key
#  feed_id             :integer
#  content_url         :string(255)
#  published_date      :date
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
  validates :feed_id, :published_date, :type, presence: true
  
  validate do |entry|
    entry.errors[:type] << "must be a valid subclass of Entry" unless Entry.descendants.map{|klass| klass.name}.include?(entry.type)
  end

  default_scope order: 'entries.published_date DESC'

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

      def add_news(entries)
        imgs = 0
        entries.each do |entry|
          record = create_entry(entry)
          imgs += 1 if record.type == 'Image'
          record.save
          print record.type + " from feed: " + record.feed_id.to_s + " saved" + "\n"
        end
        imgs
      end

      def create_entry(entry)
        feed_id = get_author(entry.entry_id)
        type = get_type(feed_id, entry)
        record = type.constantize.new
        record.feed_id = feed_id
        get_entry_attributes(record, entry)
        record
      end

      def get_entry_attributes(record, entry)
        record.title = get_title(entry, record.feed_id)
        record.content_url = get_content_url(record, entry)
        record.box_size = get_box_size(record.type, record.title)
        record.avatar = get_avatar(record.type, record.content_url)
        record.published_date = entry.published
        record.entry_id = entry.entry_id
      end

      def get_box_size(type, title)
        type == 'Tweet' ? Tweet.get_tweet_length(title[10..-1]) : 1
      end

      def get_title(entry, author)
        case author
        when 4 #twitter
          Tweet.paint_tweet_text(entry.title[10..-1])
        when 1 #tumblr
          doc = Nokogiri::HTML(entry.summary)
          doc.xpath("//text()").to_s
        else
          entry.title
        end
      end

      def get_type(feed_id, entry)
        case feed_id
        when 1
          get_tumblr_type(entry.summary)
        when 4
          'Tweet'
        else
          'Image'
        end
      end

      def get_content_url(record, entry)
        case record.feed_id
        when 1
          get_tumblr_content_url(record.type, entry.summary)
        when 4
          entry.url
        else
          get_img_src(entry.summary)
        end
      end

      def get_tumblr_type(summary)
        if !get_img_src(summary).blank?
          'Image'
        elsif !get_video_src(summary).blank?
          'Video'
        elsif !get_link_href(summary).blank?
          'Link'
        else
          'Quote'
        end
      end

      def get_tumblr_content_url(type, summary)
        if type == 'Image'
          get_img_src(summary)
        elsif type == 'Video'
          get_video_src(summary)
        elsif type == 'Link'
          get_link_href(summary)
        else
          ''
        end
      end
      
      def get_avatar(type, img_url)
        if type == 'Image'
          Image.get_avatar(img_url)
        else
          nil
        end 
      end

      def get_img_src(entry)
        html = Nokogiri::HTML(entry)
        html.css('img/@src').to_s
      end

      def get_link_href(entry)
        html = Nokogiri::HTML(entry)
        html.css('a/@href').to_s
      end

      def get_video_src(entry)
        html = Nokogiri::HTML(entry)
        url = html.css('iframe/@src').to_s
        if url.index('vimeo') != nil
          "http://vimeo.com/#{url.to_s[/\d+/]}"
        else
          url
        end
      end

      def get_author(entry)
        if entry.index('culture') != nil
          1 #tumblr
        elsif entry.index('flickr') != nil
          2 #flickr
        elsif entry.index('distilleryimage') != nil
          3 #instagram
        else
          4 #twitter
        end
      end
    end
end
