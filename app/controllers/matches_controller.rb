class MatchesController < ApplicationController
  def new
  end

  def create
    m=Match.new
    m.members.append(current_member)
    m.scorer_id=current_member.id
    m.track=params[:match][:track]
    m.save!
    redirect_to m
  end

  def show
    @match=Match.find(params[:id])
  end

  private
  def match_params
    params.require(:match).permit(:track,:members,:scorer_id)
  end
end
