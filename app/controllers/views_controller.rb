class ViewsController < ApplicationController
  def show
  	@url = Url.where(short: params[:shortyid]).take
    @url.visits.create
  	redirect_to @url.long
  end
end
