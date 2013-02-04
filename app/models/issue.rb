class Issue < ActiveRecord::Base
  attr_accessible :name, :sprint, :user
  belongs_to :sprint
  has_many :sessions

  STATUS = [:not_started, :in_progress, :feedback, :rejected, :accepted]

  def status
    STATUS[status_id]
  end

  def status=(value)
    update_attribute(:status_id, STATUS.index(value)) if STATUS.include?(value)
  end

  def start_by(user)
    session = sessions.create(user: user)
    user.update_attribute(:current_session, session)
  end

  def total_time_spent_on
    sessions.map(&:time_spent).inject(:+) || 0
  end

  def time_spent_by(user)
    sessions.where(user_id: user.id).map(&:time_spent).inject(:+) || 0
  end
end
