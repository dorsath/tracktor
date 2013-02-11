module ApplicationHelper
  def time_in_hours_rounded_on_quarters(time_in_seconds)
    rough_hours = (time_in_seconds / 3600.0)
    hours = rough_hours.floor
    remainder = rough_hours - hours
    quarters_remaining = (remainder  * 60 / 15).round * 15

    "#{"%02d" % hours}:#{"%02d" % quarters_remaining}"
  end
end
