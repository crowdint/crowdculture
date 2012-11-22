class Image < Entry

  def self.check_news_box_size(news)
    entries = Image.find(:all, :order => "id desc", :limit => news)
    entries.each do |entry|
      get_size(entry)
    end
  end

  def self.get_size(entry)
    avatar = entry.avatar
    photo_path = (avatar.options[:storage] == :s3) ? avatar.url : avatar.path
    geo ||= Paperclip::Geometry.from_file(photo_path)
    if geo.width / geo.height > 1.8 
      entry.update_attribute(:box_size, 2)
    end
  end

  def self.get_avatar(img_url)
    URI.parse(URI.encode(img_url.to_s))
  end

  def self.get_fb_images_news
    imgs = 0
    graph_data = get_fb_images
    graph_data.each do |photo|
      if Entry.exists?(:entry_id => photo["id"])
        break
      else
        imgs += 1
        add_fb_news(photo)
      end
    end
    imgs
  end

  def self.get_fb_images
    api = Koala::Facebook::API.new
    api.get_connections("10151330276113829", "photos")
  end

  def self.add_fb_news(photo)
    id = photo["id"]
    feed_id = 5
    content_url = photo["source"]
    published_date = photo["created_time"]
    title = "Crowd interactive - The Best Place to Work"
    avatar = get_avatar(content_url)
    Image.create(entry_id: id, content_url: content_url, feed_id: feed_id, 
                 published_date: published_date, title: title, avatar: avatar)
  end
end