class Round < ActiveRecord::Base
  belongs_to :member
  has_many :scores
  validates_inclusion_of :track, in: Choices['track']
  after_create :add_scores

  def number_of_holes
    self.scores.count
  end

  def holes_remaining
    unplayed=0
    self.scores.each do |s|
      if !s.strokes
        unplayed+=1
      end
    end
    unplayed
  end

  def holes_played
    played=0
    self.scores.each do |s|
      if s.strokes
        played+=1
      end
    end
    played
  end

  def score
    score=0
    self.scores.each do |s|
      if s.strokes
        score+=s.strokes
      end
    end
    score
  end

  def par
    par=0
    self.scores.each do |s|
      par+=s.hole.par
    end
    par
  end

  def current_par_status
    current_par=0
    self.scores.each do |s|
      if s.strokes
        current_par+=s.offset
      end
    end
    current_par
  end

  def over_under
    score= self.score-self.par
    if score > 0
      score= '+' + score.to_s
    else
      score
    end
  end

  def is_complete?
    self.scores.each do |s|
      if !s.strokes
        return false
      end
    end
    return true
  end

  def next_hole_id
    if !self.is_complete?
      self.scores.each do |s|
        if !s.strokes
        return  s.hole.id
        end
      end
    end
    nil
  end

  def score_by_hole_id(h)
    self.scores.each do |s|
      if s.hole_id==h
          return s
      end
    end
    return nils
  end

private
  def add_scores
    if self.track.include? 'w'
      i=1
      while i<10
        Score.create(hole_id:i,round_id:self.id)
        i+=1
      end
    end
    if self.track.include? 'b'
      i=10
      while i<19
        Score.create(hole_id:i,round_id:self.id)
        i+=1
      end
    end
    if self.track.include? 'r'
      i=19
      while i<28
        Score.create(hole_id:i,round_id:self.id)
        i+=1
      end
    end
  end


end
