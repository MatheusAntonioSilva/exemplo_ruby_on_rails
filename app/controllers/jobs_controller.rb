class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  # GET /jobs
  # GET /jobs.json
  def index
    @jobs = Job.order("created_at DESC").all

    respond_to do |format|
      format.html  #index.html.erb
      format.json {render json: @jobs}
    end

  end

  # GET /jobs/1
  # GET /jobs/1.json

   def premium
    @jobs = Job.where(premium: true).order("created_at DESC").all
    #paginate(page: params[:page], per_page: 10)

    @jobs = Job.paginate(page: params[:page], per_page: 10)
  end


  def show

  end

  def comments
    @job = Comment.all
  end

 
  # GET /jobs/new
  def new
    @job = Job.new
    #@job = Comment.new
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(job_params)

    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
     # @comment = @job.comments.build
     # @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:title, :description, :premium, :id)
      #params.require(:comment).permit(:id, :name, :body)
    end
    def comment_params
       params.require(:comment).permit(:id, :name, :body)
 
    end
end
