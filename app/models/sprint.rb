class Sprint < ActiveRecord::Base
  attr_accessible :name, :active

  belongs_to :product
  has_many :issues
end
