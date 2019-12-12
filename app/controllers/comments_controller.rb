class CommentsController < ApplicationController
  load_and_authorize_resource

  def create
    @podcast = Podcast.find(params[:podcast_id])
    @comment = @podcast.comments.create(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to podcast_path(@podcast), notice:
      I18n.t('podcasts.comments.create_success')
    else
      redirect_to podcast_path(@podcast), alert:
      I18n.t('podcasts.comments.create_fail')
    end
  end

  def destroy
    @podcast = Podcast.find(params[:podcast_id])
    @comment = @podcast.comments.find(params[:id])
    if @comment.destroy
      redirect_to podcast_path(@podcast), notice:
      I18n.t('podcasts.comments.delete_success')
    else
      redirect_to podcast_path(@podcast), alert:
      I18n.t('podcasts.comments.delete_fail')
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :podcast_id, :user_id)
  end
end
