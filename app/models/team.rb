class Team < ActiveRecord::Base
  belongs_to :user
  has_many :members, :foreign_key => :team_id, :dependent => :destroy
  has_many :athletes, :through => :members, :source => :user, :dependent => :destroy
end
