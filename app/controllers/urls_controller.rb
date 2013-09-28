class UrlsController < ApplicationController
  def new
  	@url = Url.new
  end

  def create
  	@new_url = Url.new(url_params)

  	if @new_url.save
  		render :new, notice: "Shorty'd!"
  	else
  		render :new, alert: "Something went wrong"
  	end

  end

private

 	def url_params
 		params.require(:url).permit(:long)
 	end

end
