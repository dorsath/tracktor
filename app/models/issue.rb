class Issue < ActiveRecord::Base
  attr_accessible :name, :sprint_id
  belongs_to :sprint
end
