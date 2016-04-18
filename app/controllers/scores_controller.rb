class ScoresController < ApplicationController
  def create
  end

  def new
  end

  def edit
  end

  def show
    @score=Score.find(params[:id])
    render 'rounds/js/newscore'
  end

  def update
    score=Score.find(params[:id])
    score.update_attributes(update_score_params)
    @round=Round.find(score.round_id)
    render 'rounds/js/hidescoreform'
  end

  def destroy
    binding.pry
  end

  private
  def update_score_params
    params.require(:score).permit(:id,:strokes,:hole_id,:date,:member_id,:created_at,:gir,:fairway,:putts,:round_id)
  end
end
