class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :is_coach, :is_athlete, :coach_id

  has_many :members, :foreign_key => :user_id, :dependent => :destroy
  has_many :teams, :through => :members, :source => :team, :dependent => :destroy
  has_many :categories

  scope :coaches, :conditions => ['is_coach = ?', true]
  def my_athletes
    return User.where('is_athlete = ? AND coach_id = ?', true, self.id)
  end
  def member?(team_id = nil)
    if Member.where("team_id = ? AND user_id = ?", team_id, self.id).empty?
      return false
    end
    return true
  end
end
