class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    side_job = SideJob.find(params[:side_job_id])
    @comment = side_job.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:notice] = 'コメントしました'
    else
      flash[:alert] = 'コメントできませんでした'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
