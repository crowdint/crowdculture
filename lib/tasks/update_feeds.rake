namespace :db do
  desc "Update feeds"
  task :update_feed  => :environment do
    require 'feedzirra'
    feeds_urls = Feed.all
    a=[]
    feeds_urls.each do |feed|
      a<<feed.url
    end
    feeds = Feedzirra::Feed.fetch_and_parse(feeds_urls)
    feeds.keys.each do |url|
      entries = sort_entries(feeds[url].entries)
      news = check_for_news(entries)
      if !news.empty?
        news.each do |entry|
          img =  get_img_src(entry.summary)
          if !img.blank?
            author =  get_author(entry.entry_id)
            Entry.create(feed_id: author, img_url: img.to_s, published_date: entry.published, title: entry.title, entry_id:entry.entry_id)
          end
        end
      end   
    end
  end

    private
      def check_for_news(entries)
        news[]
        i=0
        #loop that goes until it finds an entry thats already in the database.. if its not it adds it to a new array
      end

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