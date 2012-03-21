class Template < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  validates :name, :unit, :sets, :reps, :interval, :user_id, :category_id,  :presence => true
  has_many :tsession
end
