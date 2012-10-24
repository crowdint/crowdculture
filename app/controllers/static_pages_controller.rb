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
    feeds_urls = Feed.all
    feeds_urls_array=[]
    feeds_urls.each do |feed|
      feeds_urls_array<<feed.url
    end
    feeds = Feedzirra::Feed.fetch_and_parse(feeds_urls_array)
    feeds.keys.each do |url|
      entries = sort_entries(feeds[url].entries)
      entries.each do |entry|
        img =  get_img_src(entry.summary)
        if !img.blank?
          author = get_author(entry.entry_id)
          Entry.create(feed_id: author, img_url: img.to_s, published_date: entry.published, title: entry.title, entry_id:entry.entry_id)
        end
      end
    end
      @entries = Entry.count
  end

    private

      def get_img_src(entry)
        html = Nokogiri::HTML(entry)
        img = html.css('img/@src')
      end

      def sort_entries(entries)
        entries_sorted = entries.sort_by { |i| i.published}.reverse
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
