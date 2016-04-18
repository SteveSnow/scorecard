class Invite < ActiveRecord::Base
  belongs_to :match
  belongs_to :member
end
