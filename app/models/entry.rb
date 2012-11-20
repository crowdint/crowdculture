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
          author =  get_author(entry.entry_id)
          title = get_title(entry, author)
          url_type = get_content_url(entry, author)
          box_size = 1
          if url_type[1] == 'Image'
            avatar = get_avatar(url_type[0])
            imgs += 1
          elsif url_type[1] == 'Tweet'
            box_size = Tweet.get_tweet_length(title)
          else
            avatar = nil
          end 
          create_entry(url_type[1], author, entry.published, title, entry.entry_id, url_type[0].to_s, box_size, avatar)
        end
        imgs
      end

      def create_entry(type, feed_id, published_date, title, entry_id, content_url, box_size, avatar)
        type.constantize.create(feed_id: feed_id,
                                published_date: published_date,
                                title: title,
                                entry_id: entry_id,
                                content_url: content_url,
                                type: type,
                                box_size: box_size,
                                avatar: avatar)
      end

      def get_title(entry, author)
        case author
        when 4 #twitter
          entry.title[10..-1]
        when 1 #tumblr
          doc = Nokogiri::HTML(entry.summary)
          doc.xpath("//text()").to_s
        else
          entry.title
        end
      end

      def get_content_url(entry, author) #returns array
        if author == 1 #tumblr
          get_tumblr_content(entry.summary)
        elsif author == 4 #twitter
          [entry.url, 'Tweet']
        else
          [get_img_src(entry.summary), 'Image']
        end
      end

      def get_tumblr_content(summary) #returns array
        if !get_img_src(summary).blank?
          [get_img_src(summary), 'Image']
        elsif !get_video_src(summary).blank?
          [get_video_src(summary), 'Video']
        elsif !get_link_href(summary).blank?
          [get_link_href(summary), 'Link']
        else
          ['', 'Quote']
        end
      end
      
      def get_avatar(img_url)
        avatar = URI.parse(URI.encode(img_url.to_s))
      end

      def get_img_src(entry)
        html = Nokogiri::HTML(entry)
        img = html.css('img/@src')
      end

      def get_link_href(entry)
        html = Nokogiri::HTML(entry)
        url = html.css('a/@href')
      end

      def get_video_src(entry)
        html = Nokogiri::HTML(entry)
        url = html.css('iframe/@src')
        if url.index('vimeo') != nil
          "http://vimeo.com/#{url.to_s[/\d+/]}"
        end
      end

      def get_author(entry)
        if entry.index('culture') != nil
          author = 1 #tumblr
        elsif entry.index('flickr') != nil
          author = 2 #flickr
        elsif entry.index('distilleryimage') != nil
          author = 3 #instagram
        else
          author = 4 #twitter
        end
        author
      end

    end
end
