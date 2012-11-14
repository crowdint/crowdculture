class StaticPagesController < ApplicationController
	
  def home
  end

  def show_entries
    if params[:feed].to_i == 0
      @entries = Entry.scoped.paginate(:page => params[:page], :per_page => params[:per_page])
    else
      @entries = Entry.scoped.where(:feed_id=>params[:feed].to_i).paginate(:page => params[:page], :per_page => params[:per_page])
    end
    
    respond_to do |format|
      format.js
    end
  end
  
end
