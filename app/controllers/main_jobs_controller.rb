class MainJobsController < ApplicationController
  def new
    @job = current_user.jobs.build
  end

  def create
    @job = current_user.jobs.build(job_params)
    @job.save
    if @job.save
      flash[:success] = 'job registered!'
      redirect_to user_path(current_user.id)
    else
      flash[:success] = 'register faild'
      render :new
    end
  end

  def edit
    @job = Job.find_by(id: params[:id])
  end

  def update
    @job = Job.find_by(id: params[:id])
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
    params.require(:job).permit(:name, :work_type, :company, :section,
                                :industry,
                                :medium, :occupation, :started_at,
                                :ended_at, :worktime_week, :description,
                                :pulled_skill, :returned_skill, :is_main, :user_id)
  end
end
