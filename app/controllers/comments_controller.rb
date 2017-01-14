class CommentsController < ApplicationController

def create
  
  #@comment = ActionController::parameters 
	@job = Job.find(params[:job_id])
  #@comment = params.permit([:name, :body])
  @comment = @job.comments.create(params[:comment].permit(:name, :body))
	#@comment = @job.comments.build(params[:name])
 # @comment = @job.comments.build(params[:body])
  if @comment.save
  flash[:notice] = "Comentario criado com sucesso!"
  else
  flash[:alert] = "Falha na criação do comentario!"
end

 #   puts " ***********************create comments"

	#@comment = Comment.new(comment_params)
	# respond_to do |format|
   #   if @comment.save
    #    format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
     #   format.json { render :show, status: :created, location: @comment }
      #else
       # format.html { render :new }
        #format.json { render json: @commet.errors, status: :unprocessable_entity }
      #end
    #end
  #end

	redirect_to @job
  def comment_params
       params.require(:comment).permit(:id, :name, :body)
 
end

end
def destroy
  @comment = Comment.find(params[:id])
  @comment.destroy
  redirect_to @comment.job, notice: "Comentario Deletado com Sucesso!"
end


    # Never trust parameters from the scary internet, only allow the white list thro
  end