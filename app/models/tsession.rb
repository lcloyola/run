class Tsession < ActiveRecord::Base
  belongs_to :template
  belongs_to :user
  has_many :log
  validates :trainingday, :user_id,  :presence => true
  scope :done, :conditions => ['is_done = ?', true]
  scope :pending, :conditions => ['is_done = ?', false]
  
  def rep_arr
    arr = Array.new(self.template.sets) {Array.new(self.template.reps)}
    self.log.each do |log|
      arr[log.set - 1][log.repetition - 1] = log.value
    end
    return arr
  end
  
  def set_arr
    arr = Array.new(self.template.reps) {Array.new(self.template.sets)}
    self.log.each do |log|
      arr[log.repetition - 1][log.set - 1] = log.value
    end
    return arr
  end

  def ave_rep
    arr = []
    self.rep_arr.each do |rep|
      arr << ( rep.inject{|sum,x| sum + x } / self.template.reps.to_f)
    end
    return arr
  end
  
  def ave_set
    arr = []
    self.set_arr.each do |set|
      arr << ( set.inject{|sum,x| sum + x } / self.template.sets.to_f)
    end
    return arr
  end
end
