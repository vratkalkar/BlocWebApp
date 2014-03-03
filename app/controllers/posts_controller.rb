class PostsController < ApplicationController
  
  def show
    @posts = Post.find(params[:id])
    @topics = Topic.find(params[:topic_id])
  end

  def new
    @topics = Topic.find(params[:topic_id])
    @posts = Post.new
    authorize! :create, Post, message: "You need to be a member to create a new post."
  end

  def create
    @topics= Topic.find(params[:topic_id])
    @posts = current_user.posts.build(params[:post])
    @posts.topic = @topics

  authorize! :create, @posts, message: "You need to be signed up to do that."
       if @posts.save
         flash[:notice] = "Post was saved."
          redirect_to @posts
     else
         flash[:error] = "There was an error saving the post. Please try again."
       render :new

       authorize! :create, @posts, message: "You need to be signed up to do that."
        if @posts.save
      end
     end
    end



  def edit
    @topics = Topic.find(params[:topic_id])
    @posts = Post.find(params[:id])
    authorize! :edit, @posts, message: "You need to own the post to edit it."
  end

  def update
    Atopics = Topic.find(params[:topic_id])
    @posts = Post.find(params[:id])
    authorize! :update, @posts, message: "You need to own the post to edit it."
    if @posts.update_attributes(params[:posts])
      flash[:notice] = "Post was updated."
      redirect_to @posts
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :edit
  end
 end
end

