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
        if page == '1'
          entries = get_paginated_entries(page, per_page)
          tweets = Tweet.most_recent_tweets
          merge_entries(entries, tweets)
        else
          get_paginated_entries(page, per_page).map
        end  
      end

      def merge_entries(entries, tweets)
        (entries + tweets).sort! {|x,y| x.published_date <=> y.published_date}.reverse
      end

      def get_paginated_entries(page, per_page)
        Entry.where("feed_id != 3").page(page).per(per_page)
      end

      def filtered_feed(feed, page, per_page)
        Entry.where(:feed_id=>Feed.get_feed_id(feed)).page(page).per(per_page).map
      end
  
end
