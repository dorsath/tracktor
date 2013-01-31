class Product < ActiveRecord::Base
  attr_accessible :name

  has_many :sprints

  def active_sprints
    sprints.where(active: true)
  end
end
