class RoundsController < ApplicationController
  def new
  @round=Round.first
  end

  def show
    @round=Round.find(params[:id])
  end

#Methods to handle nested scores within the rounds
  def get_score
  @score=Score.find(score_params[:id])
  render 'rounds/newscore'
  end

  def update_score
    @score=Score.find(score_params[:id])
    @score.update(strokes:  update_score_params[:strokes])
    render 'rounds/hidescore'
  end


  def complete
    render :layout => false
  end

  def in_progress
    render :layout => false
  end

private
def score_params
  params.require(:score).permit(:strokes,:id)
end

def update_score_params
  params.permit(:strokes)
end
end
