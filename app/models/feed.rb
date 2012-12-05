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
      feeds_urls = get_feeds_urls
      feeds_urls.each do |feed|
        feed_entries = Parser.parse_feed(feed)
        news = Entry.check_for_news(feed_entries)
        if !news.blank?
          imgs = Parser.parse_entries(news, get_feed_author_from_url(feed))
          Image.check_news_box_size(imgs)
        end
      end
    end

    def get_feeds_urls
      feeds = Feed.all
      urls = []
      feeds.each {|feed| urls << feed.url unless feed.url == 'none'}
      urls.delete('none')
      urls
    end

    def get_feed_id(name)
      Feed.find_by_author(name).id if Feed.find_by_author(name)
    end

    def get_feed_author(id)
      Feed.find(id).author
    end

    def get_feed_author_from_url(url)
      Feed.find_by_url(url).author
    end
  end

end
