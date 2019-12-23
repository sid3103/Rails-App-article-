class ArtsController < ApplicationController	
	def new
        @art = Art.new
	end	
	def edit
		@art = Art.find(params[:id])
	end
	def index
  	  @art = Art.includes(:resumes)
  	end
	def create
	  @art = Art.new(art_params)
	 
	  if @art.save
	    redirect_to @art
  	  else
		render 'new'
 	 end
	end
	def show
  	  @art = Art.find(params[:id])
 	 end
 	def update
	  @art = Art.find(params[:id])
	 
	  if @art.update(art_params)
		    redirect_to @art
	  else
		    render 'edit'
	  end
	end
	def destroy

	  @art = Art.find(params[:id])
	  @art.destroy
	 
	  redirect_to arts_path
	end 
private
  def art_params
    params.require(:art).permit(:title, :text)
  end
end
