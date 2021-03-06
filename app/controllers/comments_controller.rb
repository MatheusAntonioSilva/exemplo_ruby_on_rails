class CommentsController < ApplicationController

def create
  
  #@comment = ActionController::parameters 
	@job = Job.find(params[:job_id])
  #@comment = params.permit([:name, :body])
  @comment = @job.comments.create(params[:comment].permit(:name, :body))
	#@comment = @job.comments.build(params[:name])
 # @comment = @job.comments.build(params[:body])

 if success = @comment.save
    CompanyMailer.new_comment(@job, @comment).deliver
 end
  respond_to do |format|
    format.html do
        if success
        flash[:notice] = "Comentario criado com sucesso!"
        else
        flash[:alert] = "Falha na criação do comentario!"
        end
	redirect_to @job
      end
    format.js
    end
  end


  def comment_params
       params.require(:comment).permit(:id, :name, :body)
 
end


def destroy
  @comment = Comment.find(params[:id])
  @comment.destroy
  redirect_to @comment.job, notice: "Comentario Deletado com Sucesso!"
end


    # Never trust parameters from the scary internet, only allow the white list thro
  end