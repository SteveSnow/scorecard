class Hole < ActiveRecord::Base
has_one :yardage
has_many :scores
end
