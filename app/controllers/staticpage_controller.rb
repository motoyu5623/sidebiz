class StaticpageController < ApplicationController
  def index
    @jobs = SideJob.includes(:user, :skills, :main_job).order(updated_at: :desc).page(params[:page])
  end
end
