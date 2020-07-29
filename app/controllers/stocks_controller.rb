class StocksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_side_job, only: %i[create destroy]
  def create
    @stock = current_user.stocks.build(side_job_id: params[:side_job_id])
    @stock.save!
    # redirect_back(fallback_location: root_path)
  end

  def destroy
    current_user.stocks.find_by(side_job_id: params[:side_job_id]).destroy!
    # redirect_back(fallback_location: root_path)
  end

  private

  def set_side_job
    @side_job = SideJob.find(params[:side_job_id])
  end
end
