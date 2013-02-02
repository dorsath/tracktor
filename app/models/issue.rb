class Issue < ActiveRecord::Base
  attr_accessible :name, :sprint, :user
  belongs_to :sprint
  has_many :sessions

  def start_by(user)
    session = sessions.create(user: user)
    user.update_attribute(:current_session, session)
  end
end
