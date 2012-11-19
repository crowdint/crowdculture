class Image < Entry

  def check_news_box_size(news)
    entries = Entry.find(:all, :order => "id desc", :limit => news)
    entries.each do |entry|
      if entry.avatar_file_name != nil
        get_size(entry)
      end
    end
  end

  def get_size(entry)
    avatar = entry.avatar
    photo_path = (avatar.options[:storage] == :s3) ? avatar.url : avatar.path
    geo ||= Paperclip::Geometry.from_file(photo_path)
    if geo.width / geo.height > 1.8 
      entry.update_attribute(:box_size, 2)
    end
  end
end