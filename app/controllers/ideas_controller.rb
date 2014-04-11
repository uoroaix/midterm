class IdeasController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authentic_idea, only: [:destroy, :update]

  def home
  end

  def create
    @idea = Idea.new(idea_attributes)
    @idea.user = current_user
    if @idea.save
      redirect_to ideas_path, notice: "Thank you for submitting!"
    else
      redirect_to ideas_path, alert: "Your Ideas was not saved, please try again later!"
    end
  end

  def index
    @ideas = Idea.all
  end

  def new
    @idea = Idea.new
  end

  def destroy
  end

  def show
    @idea = Idea.find(params[:id])
    @comments = Comment.all
  end

  def update
  end
  
  private

  def idea_attributes
    params.require(:idea).permit(:title, :body)
  end


  def authentic_idea
    @idea = current_user.ideas.find_by_id(params[:id])
    redirect_to root_path, alert: "Access Denied" unless @idea
    #@question will be nil if there isn't a id like that
  end

end
