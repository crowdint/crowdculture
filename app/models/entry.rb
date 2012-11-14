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
          item = Entry.create(feed_id: author, img_url: url_type[0].to_s, published_date: entry.published, 
            title: title, entry_id:entry.entry_id, content_type: url_type[1], avatar:url_type[2])
        end
      end

      def get_title(entry, author)
        case author
        when 4
          entry.title[10..-1]
        when 1
          doc = Nokogiri::HTML(entry.summary)
          doc.xpath("//text()").to_s
        else
          entry.title
        end
      end

      def get_content_url(entry, author)
        avatar=nil
        a=[]
        url=''
        type=''
        if author == 1 #tumblr
          url = get_img_src(entry.summary)
          type = 'image' unless url.blank?
          avatar = URI.parse(URI.encode(url.to_s)) unless url.blank?
          if url.blank?
            url = get_video_src(entry.summary)
            type = 'video'
          end
          if url.blank?
            url = get_link_href(entry.summary)
            type = 'link'
          end
          type = 'quote' unless !url.blank?
        elsif author == 4 #twitter
          type = 'tweet'
          url = entry.url
        else
          url = get_img_src(entry.summary)
          type = 'image'
          avatar = URI.parse(URI.encode(url.to_s)) unless url.blank?
        end
        a=[url,type,avatar]
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
