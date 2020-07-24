class StaticpageController < ApplicationController
  def index
    @jobs = Job.where(is_main: false).includes(:user, :skills).order(updated_at: :desc).page(params[:page])
  end
end
