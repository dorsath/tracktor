module ProjectsHelper
  def format_time_to_hours(time_in_seconds)
    return 0 if time_in_seconds.nil?
    (time_in_seconds / 3600).round
  end
end
