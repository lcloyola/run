class Team < ActiveRecord::Base
  belongs_to :user
  validates :name,  :presence => true
  has_many :members, :foreign_key => :team_id, :dependent => :destroy
  has_many :athletes, :through => :members, :source => :user, :dependent => :destroy
  
  def athlete_ave_reps(template_id = nil?)
    @t = Template.find(template_id)
    arr = Array.new
    self.members.each do |m|
      if !m.user.ave_rep(template_id).empty?
        arr << m.user.ave_rep(template_id)
      end
    end
    return arr
  end
end
