class HomeController < ApplicationController
  def index
    @completed_rounds=[]
    @incomplete_rounds=[]
    if current_member
      current_member.rounds.each do |r|
        if r.is_complete?
          @completed_rounds.push(r)
        else
          @incomplete_rounds.push(r)
        end
      end
    end
  end


end
