class StaticPagesController < ApplicationController
	
  def home
    @entries = Entry.scoped.paginate(page: params[:page], per_page: params[:per_page] || 20)
	  respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    require 'feedzirra'
    debugger
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

    private

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

      def add_news(entries)
        entries.each do |entry|
          img =  get_img_src(entry.summary)
          if !img.blank?
            author =  get_author(entry.entry_id)
            Entry.create(feed_id: author, img_url: img.to_s, published_date: entry.published, title: entry.title, entry_id:entry.entry_id)
          end
        end  
      end

      def get_img_src(entry)
        html = Nokogiri::HTML(entry)
        img = html.css('img/@src')
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
