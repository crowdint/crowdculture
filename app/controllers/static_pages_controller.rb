class StaticPagesController < ApplicationController
	
  def home
  end

  def show_entries
    @entries = Entry.scoped.paginate(:page => params[:page], :per_page => params[:per_page])
    @no_images = get_images_count(@entries)
    respond_to do |format|
      format.js
    end
  end

  def get_images_count(entries)
    c = 0
    entries.each do |entry|
      c +=1 unless entry.content_type != 'image'
    end
    c
  end

  def entries_per_page
    if params[:per_page]
      session[:entries_per_page] = params[:per_page]
    end
    session[:entries_per_page]
  end

end
