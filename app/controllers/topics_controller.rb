class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def new
    @topics = Topic.new
    authorize! :create, @topics, message: "You need to be an admin to do that."
  end

  def show
    @topics = Topic.find(params[:id])
    @posts = @topics.posts
  end

  def edit
    @topics = Topic.find(params[:id])
    authorize! :update, @topics, message: "You need to be an admin to do that."
  end

  def create
    @topics = Topic.new(params[:topic])
    authorize! :create, @topics, message: "You need to be an admin to do that"
    if @topic.save
      redirect_to @topics, notice: "Topic was saved successfully."
    else
      flash[:error] = "Error creating topic. Please try again."
 end
end

def update
  @topics = Topic.find(params[:id])
  authorize! :update, @topics, message: "You need to own the topic to update it."
  if @topics.update_attributes(params[:topic])
   redirect_to @topics, notice: "Topic was saved successfully."
 else
   flash[:error] = "Error saving topic. Please try again"
   render :edit
  end
 end
end

