class UrlsController < ApplicationController
  def new
  	@url = Url.new
  end

  def create
    @url = Url.new(url_params)
    @url.update(user: current_user)
  	
    if @url.save
  		redirect_to @url, notice: "Shorty'd!"
  	else
      flash[:alert] = "Not a valid url."
  		render 'new'
  	end
  end

  def show
    @url = Url.find(params[:id])
  end

private

 	def url_params
 		params.require(:url).permit(:long)
 	end

end
