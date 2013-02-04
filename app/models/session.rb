class Session < ActiveRecord::Base
  attr_accessible :from, :issue, :till, :user
  belongs_to :user
  belongs_to :issue

  before_create :set_from

  def set_from
    self.from = now
  end

  def now
    DateTime.now
  end

  def stop
    if user.current_session == self
      update_attribute(:till, now)
      user.update_attribute(:current_session, nil)
    end
  end

  def in_progress?
    till.nil?
  end

  def time_spent
    till.to_i - from.to_i
  end
end
