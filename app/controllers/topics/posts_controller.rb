# class PostsController < ApplicationController
class Topics::PostsController < ApplicationController
  before_action :set_topic

  def index
    @posts = @topic.posts
  end

  private

    def set_topic
      @topic = Topic.friendly.find(params[:topic_id])
    end
end
