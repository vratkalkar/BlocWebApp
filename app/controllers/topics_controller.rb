class TopicsController < ApplicationController
  def index
    @topics = Topics.paginate(page: params[:page], per_page: 10)
    authorize @topics
  end

  def new
    @topics = Topics.new
    @posts= Posts.all
    authorize @topics
  end

  def show
    @topics = Topics.find(params[:id])
    @posts = @topics.posts.paginate(page: params[:page], per_page: 10)
   
  end

  def edit
    @topics = Topics.find(params[:id])
    authorize @topics
  end

  def create
    @topics = Topics.find(params[:id])
    @posts= @topics.posts.build(params[:post])
    authorize @topics

    if @topic.save
      flash[:notice] = "Topic was saved successfully."
      redirect_to @topics
    else
      flash[:error] = "Error creating topic. Please try again."
      render :new
  end
end

def update
  @topics = Topics.find(params[:id])
  #authorize @topics

  if @topics.update(topics_params[])
   redirect_to @topics, notice: 'Topic was successfully updated.'
 else
   flash[:error] = "Error saving topic. Please try again"
   render :edit
  end
 end
end

private 

def topics_params

    params.require(:topic).permit('
        :name
        :description
        :public
      ')
  end



