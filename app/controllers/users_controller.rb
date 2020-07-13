class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @jobs = @user.jobs.all
    @main_job = @user.main_job
  end
end
