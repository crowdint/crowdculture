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

class Tweet < Entry
  def self.get_tweet_length(text)
    text.length > 120 ? 2 : 1
  end

  def self.paint_tweet_text(text)
    words = text.downcase.split
    words.each_with_index do |word, i|
      if word[0,1] == "@" || word[0,1] == "#" || word[0,7] == "http://"
        words[i] = "<span>#{word}</span>"
      end    
    end
    words.join(" ")
  end
end
