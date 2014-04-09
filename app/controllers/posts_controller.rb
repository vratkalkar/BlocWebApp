class PostsController < ApplicationController
  before_filter :find_topic

  def find_topic
   @topic = Topic.find(params[:topic_id])
 end

  def index
    @post = Post.all
    authorize @post
  end


  def show
   @post = Post.find(params[:id])
   @comments = @post.comments
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.new
end

  def create
   @topic = Topic.find(params[:topic_id])
   @post = current_user.posts.build(params[:post])
   @post.topic= @topic

    authorize @post
    if @post.save
      redirect_to [@topic], notice: "Post was saved successfully."
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end



  def edit
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    if @post.update_attributes(params.require(:post).permit(:title, :body))
      flash[:notice] = "Post was updated."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

def destroy
  @topic = Topic.find(params[:topic_id])
  @post = Post.find(params[:id])

  title = @post.title
  authorize @post

  if @post.destroy
     flash[:notice] = "\"#{title}\" was deleted successfully."
     redirect_to @topic
    else
      flash[:error] = "There was an error deleting the post."
      render :show
    end

 end
end


