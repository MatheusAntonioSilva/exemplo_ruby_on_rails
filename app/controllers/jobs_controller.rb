class JobsController < ApplicationController
  #before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_filter :authorize_company, only: [:new, :create, :edit, :update, :destroy]
  # GET /jobs
  # GET /jobs.json
  def index
    @jobs = Job.order("created_at DESC").includes(:company).all

    respond_to do |format|
      format.html  #index.html.erb
      format.json {render json: @jobs}
    end

  end

  # GET /jobs/1
  # GET /jobs/1.json

   def premium
    @jobs = Job.where(premium: true).order("created_at DESC").includes(:company).all
    #paginate(page: params[:page], per_page: 10)

    @jobs = Job.paginate(page: params[:page], per_page: 10)
  end

  def company
  end


  def show
    @job = Job.find(params[:id])
  end

  def comments
    @job = Comment.all
  end

 
  # GET /jobs/new
  def new
    @job = current_company.jobs.build
    #@job = Comment.new
  end

  # GET /jobs/1/edit
  def edit
    @job = current_company.jobs.find(params[:id])
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = current_company.jobs.build(job_params)

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

    @job = current_company.jobs.find(params[:id])
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
    @job = current_company.jobs.find(params[:id])
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
      params.require(:job).permit(:title, :description, :premium, :id, :name)
      #params.require(:comment).permit(:id, :name, :body)
    end
    def comment_params
       params.require(:comment).permit(:id, :name, :body)
 
    end

    def authorize_company
      unless current_company
        redirect_to root_path, alert:"You need to login to continue."
      end
    end
end
