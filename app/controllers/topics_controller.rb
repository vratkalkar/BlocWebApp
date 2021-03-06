class TopicsController < ApplicationController
  def index
    @topic = Topic.visible_to(current_user).paginate(page: params[:page], per_page:10)
  end

  def new
    @topic = Topic.new
    authorize @topic
 end


  def show
    @topic = Topic.find(params[:id])
    authorize @topic
    @posts = @topic.posts.includes(:user).includes(:comments).paginate(page: params[:page], per_page: 10)
  end


  def edit
    @topic = Topic.find(params[:id])
    authorize @topic
  end

  def create
   @topic= Topic.new(params.require(:topic).permit(:name, :description, :public))
   authorize @topic

    if @topic.save
      flash[:notice] = "Topic was saved successfully."
      redirect_to @topic
    else
      flash[:error] = "Error creating topic. Please try again."
      render :new
  end
end

def update
  @topic = Topic.find(params[:id])
  authorize @topic

  if @topic.update(params[:topic_id])
   redirect_to @topic, notice: 'Topic was successfully updated.'
 else
   flash[:error] = "Error saving topic. Please try again"
   render :edit
  end
 end

 def destroy 
  @topic = Topic.find(params[:id])
  name = @topic.name

  authorize @topic
   if @topic.destroy
    flash[:notice] = "\"#{name}\" was deleted successfully."
    redirect_to topics_path
  else
    flash[:error] = "There was an error deleting the topic."
    render :show
  end
 end
end






