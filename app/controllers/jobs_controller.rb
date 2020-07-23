class JobsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    # @jobs = Job.where(is_main: false).order(updated_at: :desc).page(params[:page])
    # @q = Job.ransack(params[:q])
    @q = Job.where(is_main: false).order(updated_at: :desc).ransack(params[:q])
    @jobs = @q.result.includes(:user, :skills).page(params[:page])
  end

  def show
    @job = Job.find(params[:id])
    @user = @job.user
    @main_job = @user.main_job
    @skills = @job.skills.pluck(:name, :importance_for_side_job, :importance_for_main_job)
    @labels = @skills.map(&:first)
    @importance_for_side_job = @skills.map(&:second)
    @importance_for_main_job = @skills.map(&:third)
  end

  def new
    if current_user.main_job.nil?
      redirect_to main_job_new_path
    else
      @job = current_user.jobs.build
      5.times do
        @job.skills.build
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
    @job = Job.find_by(id: params[:id])
    # @job.skills.create_or_find_by
    if @job.skills.blank?
      5.times do
        @job.skills.build
      end
    end
  end

  def update
    @job = Job.find_by(id: params[:id])
    @job.update(job_params)
    if @job.save
      flash[:success] = '編集に成功しました'
      redirect_to job_path(@job)
    else
      flash[:danger] = '編集に失敗しました'
      render :edit
    end
  end

  def destroy
    @job = Job.find_by(id: params[:id])
    @job.destroy
    redirect_to user_path(current_user)
  end

  private

  def job_params
    params.require(:job).permit(:name, :work_type, :company, :section,
                                :industry, :medium, :occupation, :started_at, :ended_at,
                                :worktime_week, :description, :pulled_skill, :returned_skill,
                                :is_main, :user_id, skills_attributes: %i[name job_id id importance_for_side_job importance_for_main_job])
  end
end
