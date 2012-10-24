require 'feedzirra'
def demo
    feed_urls = ["http://culture.crowdint.com/rss", "http://api.flickr.com/services/feeds/photos_public.gne?id=80179977@N05&lang=es-us&format=rss_200", "http://instagram.com/tags/crowdint/feed/recent.rss"]
    @feeds = Feedzirra::Feed.fetch_and_parse(feed_urls)
    @feeds.keys.each do |url|
      entries = sort_entries(@feeds[url].entries)
      entries.each do |entry|
        img =  get_img_src(entry.summary)
        if !img.blank?
          author =  get_author(entry.entry_id)
          Entry.create(feed_id: author, img_url: img.to_s, published_date: entry.published, title: entry.title, entry_id:entry.entry_id)
        end
      end
    end
    @entries = Entry.all
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