class SkillsController < ApplicationController
  def new
    @job = Job.find(params[:job_id])
    @skills = @job.skills.build
  end

  def create
    @job = Job.find(params[:job_id])
    @skills = @job.skills.build(skill_params)
    if @skills.save
      flash[:success] = 'skills registered!'
      redirect_to root_path
    else
      flash[:danger] = '登録できませんでした'
      render :new
    end
  end
    
  def skill_params
    params.require(:skill).permit(:name, 
              job_skills_attributes: [:id, :job_id, :skill_id, :score])
  end
end
