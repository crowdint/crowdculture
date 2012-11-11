# == Schema Information
#
# Table name: feeds
#
#  id         :integer         not null, primary key
#  url        :string(255)
#  author     :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Feed < ActiveRecord::Base
  attr_accessible :author, :url
  has_many :entries

  validates :author, :url, presence: true

  class << self
    def update_feeds
      require 'feedzirra'
      feeds_urls = Feed.all
      feeds_urls_array=[]
      feeds_urls.each do |feed|
        feeds_urls_array<<feed.url
      end
      feeds = Feedzirra::Feed.fetch_and_parse(feeds_urls_array)
      news =[]
      feeds.keys.each do |url|
        entries = feeds[url].entries
        news = check_for_news(entries ,news)
      end
      add_news(news)
    end

    def add_news(entries)
      entries.each do |entry|
        author =  get_author(entry.entry_id)
        url_type = get_content_url(entry, author)
        Entry.create(feed_id: author, img_url: url_type[0].to_s, published_date: entry.published, 
          title: entry.title[10..-1], entry_id:entry.entry_id, content_type: url_type[1], avatar:url_type[2])
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
      elsif author == 4 #tweeter
        type = 'tweet'
        url = entry.url
      else
        url = get_img_src(entry.summary)
        type = 'image'
        avatar = URI.parse(URI.encode(url.to_s)) unless url.blank?
      end
      a=[url,type,avatar]
    end

    def check_for_news(entries, news)
      entries.each do |entry|
        if Entry.exists?(:entry_id => entry.entry_id)
          break
        else
          news<<entry
        end
      end
      news
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
        author = 4 #tweeter
      end
      author
    end
  end

end
