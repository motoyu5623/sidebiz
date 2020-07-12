class JobsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = current_user.jobs.build
  end

  def create
    @job = current_user.jobs.build(job_params)
    @job.save
    if @job.save
      flash[:success] = "job registered!"
      redirect_to job_path(@job.id)
    else
      flash[:success] = "register faild"
      render :new
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    Job.update(job_params)
  end

  def destroy
    Job.destroy(job_params)
  end

  private

  def job_params
    params.require(:job).permit(:name, :work_type, :company, :section,
                                :industry,
                                :medium, :occupation, :started_at,
                                :ended_at, :worktime_week, :description,
                                :pulled_skill, :returned_skill, :is_main, :user_id)
  end
end
