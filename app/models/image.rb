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
end