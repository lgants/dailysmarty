class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update]

  def index
    @topics = Topic.page(params[:page]).per(15)
  end

  def show
    redirect_to topic_posts_path(topic_id: @topic)
  end

  def new
    # creates a new instance of topic the form can use
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to topic_posts_path(topic_id: @topic), notice: 'Topic was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @topic.update(topic_params)
      redirect_to topic_posts_path(topic_id: @topic), notice: 'Your topic was successfully updated.'
    else
      render :edit, notice: 'There was an error processing your request!'
    end
  end

  private

    def set_topic
      # the friendly method is needed because Topic.find(params[id] is looking for an ID but a URL like localhost:3000/sports is being passed
      @topic = Topic.friendly.find(params[:id])
    end

    def topic_params
      params.require(:topic).permit(:title)
    end
end
