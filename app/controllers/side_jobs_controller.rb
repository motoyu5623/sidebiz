class SideJobsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    @q = SideJob.order(updated_at: :desc).ransack(params[:q])
    @jobs = @q.result.includes({user: :avatar_attachment}, :skills, :main_job, :stocks, :comments).page(params[:page])
  end

  def show
    @job = SideJob.find(params[:id])
    @user = @job.user
    @main_job = @job.main_job
    @skills = @job.skills.pluck(:name, :importance_for_side_job, :importance_for_main_job)
    @labels = @skills.map(&:first)
    @importance_for_side_job = @skills.map(&:second)
    @importance_for_main_job = @skills.map(&:third)
    @comments = @job.comments
    @comment = @job.comments.build
  end

  def new
    if current_user.main_jobs.blank?
      redirect_to new_main_job_path, notice: '最初に本業の情報を入力してください。'
    else
      @job = current_user.side_jobs.build
      3.times do
        @job.skills.build
      end
    end
  end

  def create
    # binding.pry
    @job = current_user.side_jobs.build(job_params)
    if @job.save
      flash[:notice] = '副業の登録に成功しました'
      redirect_to side_job_path(@job)
    else
      flash.now[:alert] = '登録できませんでした'
      render :new
    end
  end

  def edit
    @job = SideJob.find_by(id: params[:id])
    # @job.skills.create_or_find_by
    # if @job.skills.blank?
    return unless @job.skills.blank?

    3.times do
      @job.skills.build
    end
    # end
  end

  def update
    @job = SideJob.find_by(id: params[:id])
    @job.update(job_params)
    if @job.save
      flash[:notice] = '編集に成功しました'
      redirect_to side_job_path(@job)
    else
      flash.now[:alert] = '編集に失敗しました'
      render :edit
    end
  end

  def destroy
    @job = SideJob.find_by(id: params[:id])
    @job.destroy
    redirect_to user_path(current_user)
  end

  def stocks
    @stocks = current_user.stock_side_jobs.includes(:user).page(params[:page])
  end

  private

  def job_params
    params.require(:side_job).permit(:name, :work_type, :company, :section,
                                     :industry, :medium, :occupation, :started_at, :ended_at,
                                     :worktime_week, :income_month,
                                     :description, :pulled_skill,
                                     :returned_skill, :main_job_id,
                                     :user_id, skills_attributes: %i[name side_job_id id importance_for_side_job importance_for_main_job])
  end
end
