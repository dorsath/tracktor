class Product < ActiveRecord::Base
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
end
