module Parser
  require 'feedzirra'
  class << self

    def parse_feed(url)
      parsed_feed = Feedzirra::Feed.fetch_and_parse(url)
      begin
        parsed_feed.entries
      rescue Exception => ex
        []
      end
    end
    
    def parse_entries(entries, feed_author)
      imgs = 0
      entries.each do |entry|
        @feed_author = feed_author
        @entry = entry
        record = create_entry
        imgs += 1 if record.type == 'Image'
        record.save
      end
      imgs
    end

    def create_entry
      type = get_type
      record = type.constantize.new
      record.feed_id = Feed.get_feed_id(@feed_author)
      record.title = get_title
      record.content_url = get_content_url(record.type)
      record.box_size = get_box_size(record.type, record.title)
      record.avatar = get_avatar(record.type, record.content_url)
      record.published_date = @entry.published
      record.entry_id = @entry.entry_id
      record
    end

    def get_box_size(type, title)
      type == 'Tweet' ? Tweet.get_tweet_length(title[10..-1]) : 1
    end

    def get_title
      case @feed_author
      when 'Twitter'
        Tweet.paint_tweet_text(@entry.title[10..-1])
      when 'Tumblr'
        doc = Nokogiri::HTML(@entry.summary)
        doc.xpath("//text()").to_s
      else
        @entry.title
      end
    end

    def get_type
      case @feed_author
      when 'Tumblr'
        get_tumblr_type
      when 'Twitter'
        'Tweet'
      else
        'Image'
      end
    end

    def get_content_url(type)
      case @feed_author
      when 'Tumblr'
        get_tumblr_content_url(type)
      when 'Twitter'
        @entry.url
      else
        get_img_src
      end
    end

    def get_tumblr_type
      if !get_img_src.blank?
        'Image'
      elsif !get_video_src.blank?
        'Video'
      elsif !get_link_href.blank?
        'Link'
      else
        'Quote'
      end
    end

    def get_tumblr_content_url(type)
      if type == 'Image'
        get_img_src
      elsif type == 'Video'
        get_video_src
      elsif type == 'Link'
        get_link_href
      else
        ''
      end
    end
    
    def get_avatar(type, img_url)
      type == 'Image' ? parse_avatar(img_url) : nil
    end

    def get_img_src
      html = Nokogiri::HTML(@entry.summary)
      html.css('img/@src').to_s
    end

    def get_link_href
      html = Nokogiri::HTML(@entry.summary)
      html.css('a/@href').to_s
    end

    def get_video_src
      html = Nokogiri::HTML(@entry.summary)
      url = html.css('iframe/@src').to_s
      if url.index('vimeo')
        "http://vimeo.com/#{url.to_s[/\d+/]}"
      else
        url
      end
    end

    def parse_avatar(img_url)
      URI.parse(URI.encode(img_url.to_s))
    end

    def get_fb_images
      api = Koala::Facebook::API.new
      api.get_connections("10151330276113829", "photos")
    end

  end
end