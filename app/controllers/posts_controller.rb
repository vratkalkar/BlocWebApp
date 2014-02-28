class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @posts = Post.find(params[:id])
  end

  def new
    @posts = Post.new
  end

  def create
     @posts = Post.new(params[:post])
  
       if @posts.save
         flash[:notice] = "Post was saved."
          redirect_to @posts
     else
         flash[:error] = "There was an error saving the post. Please try again."
       render :new
      end
    end


  def edit
    @posts = Post.find(params[:id])
  end

  def update
    @posts = Post.find(params[:id])
    if @posts.update_attributes(params[:posts])
      flash[:notice] = "Post was updated."
      redirect_to @posts
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :edit
  end
 end
end

