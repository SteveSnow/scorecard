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
    @members=[]
    Member.all.each do |m|
      if current_member.id != m.id
        @members.push(m)
      end
    end
  end

  def update
    @match=Match.find(params[:id])
    @match.update!(update_match_params)
    render 'matches/scripts/post_scores'
  end

  def update_leaderboard
    @match=Match.find(params[:match_id])
    render 'matches/scripts/update_leaderboard'
  end

  def update_multiple_scores
    puts params
    @match=Match.find(params[:match_id])
    params[:ids].each do |id|
      if Score.find(id)
        Score.find(id).update(strokes:params[:strokes][params[:ids].index(id)])
      end
    end
    next_hole
  end

  def next_hole
    @match=Match.find(params[:match_id])
    if @match.current_hole != @match.rounds.first.scores.count
      @match.update(current_hole:@match.current_hole+1)
    else
        @match.update(current_hole:1)
    end
      render 'matches/scripts/post_scores'
  end

  def previous_hole
    @match=Match.find(params[:match_id])
    if @match.current_hole != 1
      @match.update(current_hole:@match.current_hole-1)
    else
        @match.update(current_hole:@match.rounds.first.scores.count)
    end
        render '/matches/scripts/post_scores'
  end

  private
  def match_params
    params.require(:match).permit(:track,:members,:scorer_id)
  end

  def update_match_params
    params.require(:match).permit(:current_hole)
  end
end
