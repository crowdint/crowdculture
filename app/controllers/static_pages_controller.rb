class StaticPagesController < ApplicationController
	respond_to :html, :only => :home
  respond_to :js, :only => :show_entries
  def home
  end

  def show_entries
    params[:feed].to_i == 0 ? 
    @entries = all_feeds(params[:page], params[:per_page]) : 
    @entries = filtered_feed(params[:feed], params[:page], params[:per_page])
    respond_with(@entries)
  end

    private
      def all_feeds(page, per_page)
        if page == '1'
          entries = Entry.where("feed_id != 4").page(page).per(per_page)
          tweets = Tweet.find(:all, :limit => 4)
          (entries + tweets).sort! {|x,y| x.published_date <=> y.published_date}.reverse
        else
          Entry.where("feed_id != 4").page(page).per(per_page).map
        end  
      end

      def filtered_feed(feed, page, per_page)
        Entry.where(:feed_id=>feed.to_i).page(page).per(per_page).map
      end
  
end
