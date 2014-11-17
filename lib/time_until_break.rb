require_relative "time_until_break/version"

class TimeUntilBreak

  attr_reader :break_time

  def initialize (break_time="16:45:00")
    @break_time = break_time
  end

  def current_time
    Time.now.strftime("%H:%M:%S")
  end
end
