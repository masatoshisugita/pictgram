class CommentTopicsController < ApplicationController
  def create
    @comment = CommentTopic.new(comment_topic_params)
    @comment.topic_id = params[:comment_topic][:topic_id]
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to topics_path,　notice: 'コメントを投稿しました'
    else
      flash.now[:alert] = "コメントに失敗しました"
    end
  end




  private
    def comment_topic_params
      params.require(:comment_topic).permit(:topic_id, :user_id, :comment)
    end
end
