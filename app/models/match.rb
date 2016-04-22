class Match < ActiveRecord::Base
  after_create :add_scorer_rounds,:set_current_hole
  has_many :member_matches
  has_many :members, :through=> :member_matches
  has_many :invites
  has_many :rounds

def standing
  # self.rounds.sort_by(&:score)
  scored_rounds=[]
  unscored_rounds=[]
  self.rounds.each do |r|
    if r.score==0
      unscored_rounds.push(r)
    else
      scored_rounds.push(r)
    end
  end
  scored_rounds=scored_rounds.sort_by(&:score)
   scored_rounds+unscored_rounds
end

def is_complete?
  self.rounds.each do |r|
    if !r.is_complete?
      return false
    end
  end
  return true
end


def add_member(id)
  m=Member.find(id)
  if m
      self.members.append(m)
      Round.create!(member_id:m.id,track:self.track,match_id:self.id)
  end
end
  def add_scorer_rounds
    if !self.scorer_id.nil?
        Round.create!(member_id:self.scorer_id,track:self.track,match_id:self.id)
    end
  end

  def set_current_hole
    self.update(current_hole:1)
  end
end
