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
      feeds = get_feeds
      news = get_news(feeds)
      imgs_fb = Image.get_fb_images_news
      if !news.blank?
        imgs = Entry.add_news(news)
        Image.check_news_box_size(imgs + imgs_fb)
      end
    end

    def get_news(feeds)
      news=[]
      feeds.keys.each do |url|
        entries = feeds[url].entries
        news = check_for_news(entries ,news)
      end
      news
    end

    def get_feeds
      feeds_urls = Feed.all
      feeds_urls_array=[]
      feeds_urls.each do |feed|
        feeds_urls_array<<feed.url
      end
      feeds = Feedzirra::Feed.fetch_and_parse(feeds_urls_array)
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
  end

end
