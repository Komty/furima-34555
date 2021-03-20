class CommentsController < ApplicationController

  def create

    @comment = Comment.new(comment_params)
    if @comment.save
        ActionCable.server.broadcast 'comment_channel', {content: @comment, user: @comment.user }
      redirect_to item_path(@comment.item.id) # 今回の実装には関係ありませんが、このようにPrefixでパスを指定することが望ましいです。
    else
      @item = @comment.item
      @comments = @item.comments
      render "comments/show"
    end
  end

  def show
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
