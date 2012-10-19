class StaticPagesController < ApplicationController
	require 'feedzirra'
	def home
		feed_urls = ["http://feeds.feedburner.com/PaulDixExplainsNothing", "http://pipes.yahoo.com/pipes/pipe.run?_id=b550af16684280e4f9707db6b0e93945&_render=rss"]
		@feeds = Feedzirra::Feed.fetch_and_parse(feed_urls)
	end

	def demo
		feed_urls = ["http://feeds.feedburner.com/PaulDixExplainsNothing", "http://pipes.yahoo.com/pipes/pipe.run?_id=b550af16684280e4f9707db6b0e93945&_render=rss"]
		@feeds = Feedzirra::Feed.fetch_and_parse(feed_urls)
	end
end
