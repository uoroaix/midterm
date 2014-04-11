class CommentsController < ApplicationController

  before_action :authenticate_user!, except: [:index]

  def new
    @idea = Idea.find(params[:id])
    @comment = Comment.new
  end

  def show
  end

  def index
  end

  def update
  end

  def destroy
  end

  def create
    @idea = Idea.find(params[:id])
    @comment = @idea.comments.new(comment_attributes)
    @comment.user = current_user
  if @comment.save
    redirect_to @idea, notice: "Thank you for commenting!"
  else
    render :new, alert: "Sorry we try commenting again!"
  end

  end

  private

  def comment_attributes
    params.require(:comment).permit(:message)
  end

end
