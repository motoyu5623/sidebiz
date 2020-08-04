class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @side_jobs = @user.side_jobs.includes({ user: :avatar_attachment },
                                          :main_job, :comments, :stocks, :skills).order(updated_at: :desc).page(params[:page])
    @main_jobs = @user.main_jobs
  end
end
