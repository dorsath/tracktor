class Sprint < ActiveRecord::Base
  attr_accessible :name, :active

  belongs_to :project
  has_many :issues

  def is_backlog?
    project.backlog == self
  end
end
