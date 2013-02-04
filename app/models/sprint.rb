class Sprint < ActiveRecord::Base
  attr_accessible :name, :active

  belongs_to :project
  has_many :issues

  def is_backlog?
    project.backlog == self
  end

  def total_time_spent_on
    issues.map(&:total_time_spent_on).inject(:+) || 0
  end

  def time_spent_by(user)
    issues.map { |s| s.time_spent_by(user) }.inject(:+) || 0
  end
end
