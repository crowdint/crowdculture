namespace :db do
  desc "Update feeds"
  task :update_feeds  => :environment do
    require 'feedzirra'
    feeds_urls = Feed.all
    a=[]
    feeds_urls.each do |feed|
      a<<feed.url
    end
    feeds = Feedzirra::Feed.fetch_and_parse(feeds_urls)
    feeds.keys.each do |url|
      entries = feeds[url].entries
      entries = sort_entries(feeds[url].entries)
      new = true
      i =0
      until new == false
        new = add_if_new(entries[i])
      end 
    end
  end

    private
      def add_if_new(entry)
        img =  get_img_src(entry.summary)
        if !img.blank?
          author =  get_author(entry.entry_id)
          Entry.new(feed_id: author, img_url: img.to_s, published_date: entry.published, title: entry.title, entry_id:entry.entry_id)
          if entry.save
          end
        end
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