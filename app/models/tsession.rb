class Tsession < ActiveRecord::Base
  belongs_to :template
  belongs_to :user
  has_many :log
  validates :trainingday, :user_id,  :presence => true
  scope :done, :conditions => ['is_done = ?', true]
  scope :pending, :conditions => ['is_done = ?', false]
end
