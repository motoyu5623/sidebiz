class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @jobs = @user.jobs.all.order(updated_at: :desc).page(params[:page])
    @main_job = @user.main_job
  end
end
