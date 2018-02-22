class TopicsController < ApplicationController

  def index
      @topics = Topic.all.includes(:favorite_users)
      @comment_topic = CommentTopic.new
      #@comments = @topics.comment_topic.includes(:user).all
      #@comment  = @topics.comment_topics.build(user_id: current_user.id) if current_user
  end


  def new
    @topic = Topic.new
  end

  def create
    if current_user.topics.create(topic_params)
      redirect_to topics_path, notice: '投稿に成功しました'
    else
      flash.now[:alert] = "投稿に失敗しました"
      render :new
    end
  end

  def comment_create
    @comment_topic = CommentTopic.new(comment: params[:comment_topic][:comment],user_id: params[:user_id],topic_id: params[:topic_id])
     if @comment_topic.save
        redirect_to topics_path, notice: 'コメントに成功しました'
     else
        @topics = current_user.topics
        flash.now[:alert] = "コメントに失敗しました"
        render :index
     end
   end



  private
  def topic_params
    params.require(:topic).permit(:image, :description)
  end
end
