class TopicsController < ApplicationController
  def index
    @topic = Topic.all
    @topics = Topic.paginate(page: params[:page], per_page: 10)
    authorize @topic
  end

  def new
    @topic = Topic.new
    @post= Post.all
    authorize @topic
 end


  def show
    @topic = Topic.find(params[:id])
    authorize @topic
    @post = Topic.paginate(page: params[:page], per_page: 10)
   
  end

  def edit
    @topic = Topic.find(params[:id])
    authorize @topic
  end

  def create
   @topic= Topic.new(topic_params)
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

  if @topic.update(topic_params[:id])
   redirect_to @topic, notice: 'Topic was successfully updated.'
 else
   flash[:error] = "Error saving topic. Please try again"
   render :edit
  end
 end




def topic_params

    params.require(:topic).permit('
        :name
        :description
        :public
        :topic_id
      ')
  end
end



