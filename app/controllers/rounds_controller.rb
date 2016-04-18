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

  def change_view
    @view=params[:view]
    @round=Round.find(params[:id])
    render 'rounds/js/viewswitcher'
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
