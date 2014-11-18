require_relative "time_until_break/version"
require 'time'

class TimeUntilBreak

  attr_reader :break_time

  def initialize (break_time="16:45")
    @break_time = Time.parse(break_time)
  end

  def message
    has_break_been? ? missed_break : time_until_break
  end

  def time_until_break
    seconds = @break_time.to_i - current_time.to_i
    hours = (seconds/(60*60))
    minutes = ((seconds - (hours*60*60))/60)
    %x(say "#{hours} hours, #{minutes} minutes")
  end

  def has_break_been?
    current_time > @break_time
  end

  def missed_break
    %x(say "Sorry you missed the Mandatory Break.")
  end

  def current_time
    Time.now
  end
end
