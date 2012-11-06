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
        img =  get_img_src(entry.summary)
        author =  get_author(entry.entry_id)
        type = get_type(img, author)
        img = get_link_href(entry.summary) unless !img.blank?
        Entry.create(feed_id: author, img_url: img.to_s, published_date: entry.published, title: entry.title, entry_id:entry.entry_id, content_type: type)
      end  
    end

    def get_type(img, author)
      if !img.blank?
        type = 'image'
      elsif author == 4
        type = 'tweet'
      else
        type = 'quote'
      end
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

    def get_author(entry)
      if entry.index('culture') != nil
        author = 1
      elsif entry.index('amazonaws') != nil
        author = 3
      else 
        author = 2
      end
      author
    end
  end

end
