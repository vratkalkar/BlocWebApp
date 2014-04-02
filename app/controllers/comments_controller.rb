class CommentsController < ApplicationController
  def create
    @topics = Topic.find( params[:topic_id])
    @posts = @topics.posts.find( params[:post_id])
    @comments = @posts.comments

    authorize @comments

    if @comments.save
      flash[:notice] = "Comment was created."
    else
      flash[:error] = "There was an error saving the comment. Please try again."
  end
end
