class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :is_coach, :is_athlete, :coach_id, :first, :last, :about, :as_coach

  has_many :members, :foreign_key => :user_id, :dependent => :destroy
  has_many :teams, :through => :members, :source => :team, :dependent => :destroy
  has_many :categories
  has_many :tsessions
  has_many :templates
  
  scope :coaches, :conditions => ['is_coach = ?', true]
  def my_athletes
    return User.where('is_athlete = ? AND coach_id = ?', true, self.id)
  end
  def fullname
    return "#{self.last}, #{self.first}"
  end
  def member?(team_id = nil)
    if Member.where("team_id = ? AND user_id = ?", team_id, self.id).empty?
      return false
    end
    return true
  end
  def my_team
    return Team.where('user_id = ?', self.id)
  end
  def membership
    return Member.where('user_id = ?', self.id)
  end
  
  def session_per_template(template = nil)
    return Tsession.where('user_id = ? AND template_id = ?', self.id, template)
  end
  
  def currently_coach
    if self.as_coach || (!self.is_athlete && self.is_coach)
      return true
    end
    return false
  end
  
  def athlete_template_sessions(template_id = nil)
    return Tsession.where('user_id = ? AND template_id = ? AND is_done = ?', self.id, template_id, true)
  end
  
  def template_arr_reps(template_id = nil)
    arr = Array.new
    @sessions = athlete_template_sessions(template_id)
    @sessions.each do |s|
      arr << s.ave_rep
    end
    return arr
  end
end
