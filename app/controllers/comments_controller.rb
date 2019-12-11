class CommentsController < ApplicationController
  load_and_authorize_resource

  def create
    @podcast = Podcast.find(params[:podcast_id])
    @comment = @podcast.comments.create(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to podcast_path(@podcast), notice:
      "You successfully created a comment."
    else
      redirect_to podcast_path(@podcast), alert:
      "Comment could not be created."
    end
  end

  def destroy
    @podcast = Podcast.find(params[:podcast_id])
    @comment = @podcast.comments.find(params[:id])
    @comment.destroy
    # After we deleted the comment, redirect to the particular podcast page we are deleting the comment from
    redirect_to podcast_path(@podcast)
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
