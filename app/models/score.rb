class Score < ActiveRecord::Base
  belongs_to :hole
  belongs_to :member
  belongs_to :round

  def is_par?
    self.strokes==self.hole.par
  end

  def is_birdie?
      self.strokes==self.hole.par-1
  end

  def is_eagle?
    if self.strokes
      self.strokes<=self.hole.par-2
    end
  end

  def is_albatros?
      self.strokes==self.hole.par-3
  end

  def is_bogey?
      self.strokes==self.hole.par+1
  end

  def is_double_bogey?
      self.strokes==self.hole.par+2
  end

  def is_other?
    if self.strokes
      self.strokes>self.hole.par+2
    end
  end

  def offset
    self.strokes-self.hole.par
  end
end
