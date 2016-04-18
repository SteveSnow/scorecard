class Match < ActiveRecord::Base
  after_create :add_scorer_rounds
  has_many :member_matches
  has_many :members, :through=> :member_matches
  has_many :invites
  has_many :rounds


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
end
