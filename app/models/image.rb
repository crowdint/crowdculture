# == Schema Information
#
# Table name: entries
#
#  id                  :integer         not null, primary key
#  feed_id             :integer
#  content_url         :string(255)
#  published_date      :datetime
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
    def check_news_box_size(news_count)
      entries = last_images_added(news_count)
      entries.each {|entry| get_size(entry)}
    end

    def last_images_added(count)
      entries = Image.find(:all, :order => "id desc", :limit => count)
    end

    def get_size(entry)
      avatar = entry.avatar
      increase_box_size(entry) if landscape?(avatar)
    end
    
    def landscape?(avatar)
      photo_path = (avatar.options[:storage] == :s3) ? avatar.url : avatar.path
      geo ||= Paperclip::Geometry.from_file(photo_path)
      geo.width / geo.height > 1.8
    end

    def increase_box_size(entry)
      entry.update_attribute(:box_size, 2)
    end

  end
end
