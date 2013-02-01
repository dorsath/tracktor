class Sprint < ActiveRecord::Base
  belongs_to :product
  has_many :issues
end
