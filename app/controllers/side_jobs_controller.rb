class SideJobsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    @q = SideJob.order(updated_at: :desc).ransack(params[:q])
    @side_jobs = @q.result.includes({ user: :avatar_attachment }, :skills, :main_job, :stocks, :comments).page(params[:page])
  end

  def show
    @side_job = SideJob.find(params[:id])
    @user = @side_job.user
    @main_job = @side_job.main_job
    @skills = @side_job.skills.pluck(:name, :importance_for_side_job, :importance_for_main_job)
    @labels = @skills.map(&:first)
    @importance_for_side_job = @skills.map(&:second)
    @importance_for_main_job = @skills.map(&:third)
    @comments = @side_job.comments
    @comment = @side_job.comments.build
  end

  def new
    if current_user.main_jobs.blank?
      redirect_to new_main_job_path, notice: '最初に本業の情報を入力してください（本業名だけ入力し、他の項目は後で入力することも可能です）'
    else
      @side_job = current_user.side_jobs.build
      3.times do
        @side_job.skills.build
      end
    end
  end

  def create
    # binding.pry
    @side_job = current_user.side_jobs.build(job_params)
    if @side_job.save
      flash[:notice] = '副業の登録に成功しました'
      redirect_to side_job_path(@side_job)
    else
      flash.now[:alert] = '登録できませんでした'
      render :new
    end
  end

  def edit
    @side_job = SideJob.find_by(id: params[:id])
    if wrong_user?
      flash[:alert] = 'あなたの投稿ではありません'
      redirect_to @side_job
    elsif @side_job.skills.blank?
      3.times do
        @side_job.skills.build
      end
    end
  end

  def update
    @side_job = SideJob.find_by(id: params[:id])
    if wrong_user?
      flash[:alert] = 'あなたの投稿ではありません'
      redirect_to @side_job
    elsif @side_job.update(job_params)
      flash[:notice] = '編集に成功しました'
      redirect_to side_job_path(@side_job)
    else
      flash.now[:alert] = '編集に失敗しました'
      render :edit
    end
  end

  def destroy
    @side_job = SideJob.find_by(id: params[:id])
    if wrong_user?
      flash[:alert] = 'あなたの投稿ではありません'
      redirect_to @side_job
    else
      @side_job.destroy
      flash[:notice] = '削除しました'
      redirect_to user_path(current_user)
    end
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

  def wrong_user?
    @user = @side_job.user
    @user != current_user
  end
end
