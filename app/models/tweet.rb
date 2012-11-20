class Tweet < Entry
  def self.get_tweet_length(text)
    text.length > 50 ? 2 : 1
  end

  def self.paint_tweet_text(text)
    words = text.downcase.split
    words.each_with_index do |word, i|
      if word[0,1] == "@" || word[0,1] == "#"
        words[i] = "<span>#{word}</span>"
      elsif word[0,7] == "http://"
        words[i] = "<span>#{word}</span>"
      end    
    end
    words.join(" ")
  end
end