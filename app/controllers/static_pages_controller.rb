class StaticPagesController < ApplicationController
	
  def home
  end

  def show_entries
    @entries = Entry.scoped.paginate(:page => params[:page], :per_page => params[:per_page])
    respond_to do |format|
      format.js
    end
  end
  
end
