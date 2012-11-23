# == Schema Information
#
# Table name: entries
#
#  id                  :integer         not null, primary key
#  feed_id             :integer
#  content_url         :string(255)
#  published_date      :date
#  title               :string(255)
#  created_at          :datetime        not null
#  updated_at          :datetime        not null
#  entry_id            :string(255)
#  type                :string(255)
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  box_size            :integer         default(1)
#

class Image < Entry

  class << self
    def check_news_box_size(news)
      entries = Image.find(:all, :order => "id desc", :limit => news)
      entries.each do |entry|
        get_size(entry)
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

    def get_avatar(img_url)
      URI.parse(URI.encode(img_url.to_s))
    end

    def get_fb_images_news
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

    def get_fb_images
      api = Koala::Facebook::API.new
      api.get_connections("10151330276113829", "photos")
    end

    def add_fb_news(photo)
      img = Image.new
      img.entry_id = photo["id"]
      img.feed_id = 5
      img.content_url = photo["source"]
      img.published_date = photo["created_time"]
      img.title = "Crowd interactive - The Best Place to Work"
      img.avatar = get_avatar(content_url)
      img.save
      print 'New Image from facebook' + "\n"
    end
  end
end
