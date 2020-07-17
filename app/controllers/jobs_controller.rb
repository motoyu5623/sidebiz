class JobsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    @jobs = Job.where(is_main: false)
  end

  def show
    @job = Job.find(params[:id])
    @user = @job.user
    @main_job = @user.main_job
  end

  def new
    if current_user.main_job.nil?
      redirect_to main_job_new_path
    else
      @job = current_user.jobs.build
      5.times do
        @job.job_skills.build
        @skills = Skill.new
      end
    end
  end

  def create
    @job = current_user.jobs.build(job_params)
    if @job.save
      flash[:success] = 'job registered!'
      redirect_to job_path(@job)
    else
      flash[:success] = 'register faild'
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
                                :industry, :medium, :occupation, :started_at, :ended_at,
                                :worktime_week, :description, :pulled_skill, :returned_skill,
                                :is_main, :user_id, job_skills_attributes: [:score, :job_id, :skill_id, :id,
                                                                            skill_attributes: %i[name id]])
  end
end
