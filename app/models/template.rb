class Template < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :tsession
end
