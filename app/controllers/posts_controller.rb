class PostsController < ApplicationController

  def index
    @posts = Posts.all
    authorize @posts
  end

  def show
    @posts = Posts.find(params[:id])
    @posts = Topics.find(params[:id])
    @posts = @posts.new
    authorize @posts
  end

  def new
    @topics = Topics.find(params[:id])
    @post = Post.new
    authorize @posts

  def create
    @topics = Topics.find(params[:id])
    @post = current_user.posts.build(params.require(:post].permit(:title, :body))
    @post.topic = @topics

  authorize @post
       if @post.save
          redirect_to [@topics, @post], notice: "Post was saved successfully."
     else
         flash[:error] = "There was an error saving the post. Please try again."
       render :new

       authorize! :create, @post, message: "You need to be signed up to do that."
        if @posts.save
      end
     end
    end



  def edit
    @topics = Topics.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @posts
  end

  def update
    @topics = Topics.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post
    if @posts.update(post_params(:posts))
      flash[:notice] = "Post was updated."
      redirect_to [@topics, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :edit
  end
 end
end

def destroy
  authorize @post
  if @post.destroy
end

