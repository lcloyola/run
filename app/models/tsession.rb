class Tsession < ActiveRecord::Base
  belongs_to :template
  belongs_to :user
  has_many :log
end
