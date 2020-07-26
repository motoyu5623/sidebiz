class MainJobsController < ApplicationController
  def new
    @user = current_user
    @main_job = @user.main_jobs.build
  end

  def create
    @main_job = current_user.main_jobs.build(job_params)
    @main_job.save
    if @main_job.save
      flash[:success] = 'job registered!'
      redirect_to user_path(current_user.id)
    else
      flash[:success] = 'register faild'
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
      flash[:success] = '編集に成功しました'
      redirect_to user_path(current_user)
    else
      flash[:danger] = '編集に失敗しました'
      render :edit
    end
  end

  private

  def job_params
    params.require(:main_job).permit(:name, :work_type, :company, :section,
                                     :industry,
                                     :medium, :occupation, :started_at,
                                     :ended_at, :worktime_week, :description,
                                     :user_id)
  end
end
