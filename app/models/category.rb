class Category < ActiveRecord::Base
  belongs_to :user
  has_many :template
  validates :name,  :presence => true
end
