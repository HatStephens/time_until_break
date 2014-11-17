require_relative "time_until_break/version"

class TimeUntilBreak

  def current_time
    Time.now.strftime("%H:%M:%S")
  end

end
