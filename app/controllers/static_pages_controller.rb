class StaticPagesController < ApplicationController
	
  def home
    @entries = Entry.scoped.paginate(page: params[:page], per_page: params[:per_page] || 20)
	  respond_to do |format|
      format.html
      format.js
    end
  end
  
end
