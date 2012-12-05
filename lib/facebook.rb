module Facebook
  class << self

    def update
      graph_data = Parser.get_fb_images
      imgs = 0
      graph_data.each do |photo|
        Entry.entry_exists?(photo["id"]) ? break : add_fb_news(photo)
        imgs += 1
      end
      Image.check_news_box_size(imgs)
    end

    def add_fb_news(photo)
      img = Image.new
      img.entry_id = photo["id"]
      img.feed_id = Feed.get_feed_id('Facebook')
      img.content_url = photo["source"]
      img.published_date = photo["created_time"]
      img.title = "Crowd interactive - The Best Place to Work"
      img.avatar = Parser.parse_avatar(img.content_url)
      img
    end

  end
end