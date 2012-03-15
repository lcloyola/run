class Member < ActiveRecord::Base
  validates :team_id, :user_id,  :presence => true
  attr_accessible :team_id, :user_id
  belongs_to :team
  belongs_to :user
end
