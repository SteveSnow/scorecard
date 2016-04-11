class Score < ActiveRecord::Base
  belongs_to :hole
  belongs_to :member
end
