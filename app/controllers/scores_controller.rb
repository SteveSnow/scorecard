class ScoresController < ApplicationController
  def create
    binding.pry
  end

  def new
    binding.pry
  end

  def edit
    binding.pry
  end

  def show
    binding.pry
  end

  def update
    binding.pry
  end

  def update
    score=Score.find(params[:id])
    score.update_attributes(update_score_params)
    @round=Round.find(score.round_id)
    render 'scores/hidescoreform'
  end

  def destroy
    binding.pry
  end

  private
  def update_score_params
    params.require(:score).permit(:id,:strokes,:hole_id,:date,:member_id,:created_at,:gir,:fairway,:putts,:round_id)
  end
end
