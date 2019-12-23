class ResumesController < ApplicationController
  def index
      @resumes = Resume.all
   end   
   def new
   	  @art = Art.find(params[:art_id])
      @resume = @art.resumes.new
   end   
   def show
     @resume = Resume.find(params[:id])
    end
   def create
   	  @art = Art.find(params[:art_id])
   	  @resume = @art.resumes.new(resume_params)      
      if @resume.save!
         redirect_to arts_path, notice: "The resume #{@resume.name} has been uploaded."
      else
         render "new"
      end
   end   
   def destroy
      @resume = Resume.find(params[:id])
      @resume.destroy
      redirect_to  welcome_index_path, notice:  "The resume #{@resume.name} has been deleted."
   end   
   private
      def resume_params
      params.require(:resume).permit(:name, :attachment)
   end   
end
