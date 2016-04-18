class Match < ActiveRecord::Base
  after_create :add_rounds
  has_many :member_matches
  has_many :members, :through=> :member_matches
  has_many :invites
  has_many :rounds



  def add_rounds
    if !self.scorer_id.nil?
        Round.create!(member_id:self.scorer_id,track:self.track,match_id:self.id)
    end
  end
end
