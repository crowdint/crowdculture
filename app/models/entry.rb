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
      def add_news(entries)
        entries.each do |entry|
          author =  get_author(entry.entry_id)
          title = get_title(entry, author)
          url_type = get_content_url(entry, author)
          url_type[1] == 'image' ? avatar = get_avatar(url_type[0]) : avatar = nil
          item = Entry.create(feed_id: author,  
                              published_date: entry.published, 
                              title: title, 
                              entry_id: entry.entry_id,
                              img_url: url_type[0].to_s,
                              content_type: url_type[1],
                              avatar: avatar)
        end
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
          [entry.url, 'tweet']
        else
          [get_img_src(entry.summary), 'image']
        end
      end

      def get_tumblr_content(summary) #returns array
        if !get_img_src(summary).blank?
          [get_img_src(summary), 'image']
        elsif !get_video_src(summary).blank?
          [get_video_src(summary), 'video']
        elsif !get_link_href(summary).blank?
          [get_link_href(summary), 'link']
        else
          ['', 'quote']
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

      def check_news_box_size(news)
        entries = Entry.find(:all, :order => "id desc", :limit => news)
        entries.each do |entry|
          if entry.avatar_file_name != nil
            avatar = entry.avatar
            get_size(avatar)
          end
        end
      end

      def get_size(avatar)
        photo_path = (avatar.options[:storage] == :s3) ? avatar.url : avatar.path
        geo ||= Paperclip::Geometry.from_file(photo_path)
        if geo.width / geo.height > 1.8 
          entry.update_attribute(:box_size, 2)
        end
      end
    end
end
