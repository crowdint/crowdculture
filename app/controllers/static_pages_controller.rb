class StaticPagesController < ApplicationController
	respond_to :html, :only => :home
  respond_to :js, :only => :show_entries
  def home
  end

  def show_entries
    case params[:feed].to_i
    when 5
      @entries = get_employees(params[:page], params[:per_page])
    when 0
      @entries = all_feeds(params[:page], params[:per_page])
    else
      @entries = filtered_feed(params[:feed], params[:page], params[:per_page])
    end
    respond_with(@entries)
  end

    private
      def all_feeds(page, per_page)
        Entry.scoped.paginate(:page => page, :per_page => per_page)
      end

      def filtered_feed(feed, page, per_page)
        Entry.scoped.where(:feed_id=>feed.to_i).paginate(:page => page, :per_page => per_page)
      end

      def get_employees(page, per_page)
        Employee.scoped.paginate(:page => page, :per_page => per_page)
      end
  
end
