class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :scores
  has_many :rounds
  has_many :member_matches
  has_many :matches, :through=> :member_matches
  has_many :invites
  
  def completed_rounds
    completed_rounds=[]
    self.rounds.each do |r|
      if r.is_complete?
      completed_rounds.push(r)
      end
    end
    completed_rounds
  end

  def in_progress_rounds
    in_progress_rounds=[]
    self.rounds.each do |r|
      if !r.is_complete?
      in_progress_rounds.push(r)
      end
    end
    in_progress_rounds
  end
end
