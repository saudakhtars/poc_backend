class Api::IdeasController < ApplicationController

  skip_before_filter  :verify_authenticity_token

  def index
    @ideas = Idea.all
    respond_to do |format|
      format.json { render json: @ideas }
    end
  end

  def create
    @idea = Idea.new(idea_params)
    @idea.save
    respond_to do |format|
      format.json { render json: @idea }
    end
  end

  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy
    render json: { success: true, response: @idea }
  end

  private

  def idea_params
    params.require(:idea).permit(
      :photo, :name, :banner, :title, :description, :likescount, :commentscount
    )
  end
end
