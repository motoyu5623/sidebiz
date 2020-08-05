class StaticpageController < ApplicationController
  def index
    @side_jobs = SideJob.includes({ user: :avatar_attachment }, :skills, :main_job, :stocks, :comments).order(updated_at: :desc).page(params[:page])
  end
end
