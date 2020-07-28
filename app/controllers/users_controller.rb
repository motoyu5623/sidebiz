class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @jobs = @user.side_jobs.all.order(updated_at: :desc).page(params[:page])
    @main_jobs = @user.main_jobs
  end
end
