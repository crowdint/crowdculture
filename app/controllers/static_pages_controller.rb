class StaticPagesController < ApplicationController
	
  def home
    @entries = Entry.scoped.paginate(page: params[:page], per_page: params[:per_page] || 10)
    @no_images = get_images_count(@entries)
	  respond_to do |format|
      format.html
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

end
