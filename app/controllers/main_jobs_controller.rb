class MainJobsController < ApplicationController
  before_action :authenticate_user!

  def new
    @user = current_user
    @main_job = @user.main_jobs.build
  end

  def create
    @main_job = current_user.main_jobs.build(job_params)
    @main_job.save
    if @main_job.save
      flash[:notice] = '本業の登録に成功しました'
      redirect_to user_path(current_user.id)
    else
      flash[:alert] = '登録できませんでした'
      render :new
    end
  end

  def edit
    @job = MainJob.find_by(id: params[:id])
  end

  def update
    @job = MainJob.find_by(id: params[:id])
    @job.update(job_params)
    if @job.update(job_params)
      flash[:notice] = '編集に成功しました'
      redirect_to user_path(current_user)
    else
      flash.now[:alert] = '編集に失敗しました'
      render :edit
    end
  end

  def destroy
    @job = MainJob.find_by(id: params[:id])
    if @job.side_jobs.present?
      flash.now[:alert] = '副業に参照されているため削除できませんでした'
      render :edit
    else
      @job.destroy
      flash[:notice] = '本業を削除しました'
      redirect_to user_path(current_user)
    end
  end

  private

  def job_params
    params.require(:main_job).permit(:name, :work_type, :company, :section,
                                     :industry,
                                     :medium, :occupation, :started_at,
                                     :ended_at, :worktime_week,
                                     :income_month, :description,
                                     :user_id)
  end
end
