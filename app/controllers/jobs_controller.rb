class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    Job.create(job_params)
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
    params.require(:job).permit(:name, :type, :section, :industry,
                                :medium, :occupation, :started_at,
                                :ended_at, :worktime_week, :description,
                                :pulled_skill, :returned_skill, :is_main)
  end
end
