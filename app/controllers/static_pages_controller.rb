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
        Entry.scoped.paginate(:page => page, :per_page => per_page)
      end

      def filtered_feed(feed, page, per_page)
        Entry.scoped.where(:feed_id=>feed.to_i).paginate(:page => page, :per_page => per_page)
      end
  
end
