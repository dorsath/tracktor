class Project < ActiveRecord::Base
  attr_accessible :name

  has_many :sprints
  after_create :create_backlog

  def active_sprints
    sprints.where(active: true)
  end

  def create_backlog
    sprints.create(name: "Backlog", active: true)
  end

  def backlog
    sprints.first
  end

  def total_time_spent_on
    sprints.map(&:total_time_spent_on).inject(:+) || 0
  end

  def time_spent_by(user)
    sprints.map { |s| s.time_spent_by(user) }.inject(:+) || 0
  end
end
