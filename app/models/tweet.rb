class Tweet < Entry
  def self.get_tweet_length(text)
    text.length > 50 ? 2 : 1
  end

  def self.paint_tweet_text(text)
    #tweet hash color #7fbfb9
  end
end