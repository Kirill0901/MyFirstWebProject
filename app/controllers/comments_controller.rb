# frozen_string_literal: true

# comments_controller
class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    puts comment_params.to_json
    @comment = @post.comments.create(comment_params)
    @comment.post_id = @post.id

    if @comment.save
      redirect_to post_path(@post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    return unless @comment.user_id == current_user.id
    @comment.destroy
    redirect_to post_url(@post, locale: I18n.locale)
  end

  private

  def comments_params
    params.require(:comments).permit(:user, :body).merge(user_id: current_user.id)
  end

  def comment_params
    params.require(:comment).permit(:user, :body).merge(user_id: current_user.id)
  end
end
