class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @posts = Post.find(params[:id])
  end

  def new
    @posts = Post.new
    authorize! :create, Post, message: "You need to be a member to create a new post."
  end

  def create
     @posts = Post.new(params[:post])
  
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
    @posts = Post.find(params[:id])
    authorize! :edit, @posts, message: "You need to own the post to edit it."
  end

  def update
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

