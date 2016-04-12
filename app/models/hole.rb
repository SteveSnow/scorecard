class Hole < ActiveRecord::Base
has_one :yardage
has_many :scores

def number
  return self.name[1]
end

def course
case self.name[0].upcase
when 'W'
  return 'White'
when 'R'
  return 'Red'
when 'B'
  return 'Blue'
end
end
end
