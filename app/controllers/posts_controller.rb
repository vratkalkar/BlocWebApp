class PostsController < ApplicationController

  def index
    @post = Post.all
    authorize @post
  end


  def show
    @post = Post.find(params[:id])
    @comment = @post.comments.build
    @post = Topic.find(params[:topic_id])
    authorize @post
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
    authorize @post
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post= current_user.posts.build(params[:id])
    @post.topic = @topic

  authorize @post
       if @post.save
          redirect_to [@topic, @post], notice: "Post was saved successfully."
     else
         flash[:error] = "There was an error saving the post. Please try again."
       render :new

       authorize! :create, @post, message: "You need to be signed up to do that."
        if @post.save
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
    authorize @post
  end
    if @post.update(post_params(:posts))
      flash[:notice] = "Post was updated."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :edit
  end
 end


def destroy
  authorize @post
  if @post.destroy
 end
end
end
