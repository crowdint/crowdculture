class StaticPagesController < ApplicationController
	
  def home
    @entries = Entry.scoped.paginate(page: params[:page], per_page: params[:per_page] || 20)
	  respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    require 'feedzirra'
    feeds_urls = Feed.all
    a=[]
    feeds_urls.each do |feed|
      a<<feed.url
    end
    @feeds = Feedzirra::Feed.fetch_and_parse(feeds_urls)
  end
end
