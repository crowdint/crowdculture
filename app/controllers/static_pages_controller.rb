class StaticPagesController < ApplicationController
	respond_to :html, :only => :home
  respond_to :js, :only => :show_entries
  def home
  end

  def show_entries
    params[:feed] == 'All' ? 
    @entries = all_feeds(params[:page], params[:per_page]) : 
    @entries = filtered_feed(params[:feed], params[:page], params[:per_page])
    respond_with(@entries)
  end

    private
      def all_feeds(page, per_page)
          entries = get_paginated_entries(page, per_page).to_a
          tweets = Tweet.most_recent_tweets(page).to_a
          entries.count != 0 ? merge_entries(entries, tweets) : tweets.map
      end

      def merge_entries(entries, tweets)
        4.times { entries.insert(rand(entries.count), tweets.pop) }
        entries.map
      end

      def get_paginated_entries(page, per_page)
        Entry.where("feed_id != #{Feed.get_feed_id('Twitter')}").page(page).per(per_page)
      end

      def filtered_feed(feed, page, per_page)
        Entry.where(:feed_id=>Feed.get_feed_id(feed)).page(page).per(per_page).map
      end
  
end
