class RoundsController < ApplicationController
  def new
  end

  def show
    @round=Round.find(params[:id])
  end

  def create
    r=Round.create!(create_round_params)
    redirect_to round_path :id=>r.id
  end


  def get_score
    @score=Score.find(score_params[:id])
    render 'rounds/newscore'
  end

  def update_score
    @score=Score.find(score_params[:id])
    @score.update(strokes:  update_score_params[:strokes])
    render 'rounds/hidescore'
  end

  def change_view
    @view=params[:view]
    @round=Round.find(params[:id])
    render 'rounds/viewswitcher'
  end

  def complete
    render :layout => false
  end

  def in_progress
    render :layout => false
  end

private
def create_round_params
  params.require(:round).permit(:track,:tee,:member_id)
end
def score_params
  params.require(:score).permit(:strokes,:id)
end

def update_score_params
  params.permit(:strokes)
end
end
