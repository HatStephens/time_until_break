require_relative "time_until_break/version"
require 'time'

class TimeUntilBreak

  attr_reader :break_time, :break_time_end

  def initialize (break_time="16:45", break_time_end="17:00")
    @break_time = Time.parse(break_time)
    @break_time_end = Time.parse(break_time_end)
  end

  def is_a_weekday
    has_break_been? ? missed_break : check_time
  end

  def check_time
    break_right_now? ? break_now : time_until_break
  end

  def is_a_weekend
    say_something("It's the weekend you silly billy.")
  end

  def time_until_break
    seconds = @break_time.to_i - current_time.to_i
    hours = (seconds/(60*60))
    minutes = ((seconds - (hours*60*60))/60)
    say_something("#{hours} hours, #{minutes} minutes until the Mandatory Break.")
  end

  def has_break_been?
    current_time > @break_time_end
  end

  def missed_break
    say_something("Sorry you missed the Mandatory Break.")
  end

  def break_right_now?
    current_time > @break_time && current_time < @break_time_end
  end

  def break_now
    say_something("Get your shizzle on, it's break time right now. All around the world.")
  end

  def current_time
    Time.now
  end

  def say_something(string)
    %x(say "#{string}")
  end

  def is_it_the_weekend?
    ["Saturday", "Sunday"].include?(current_time.strftime("%A"))
  end

  def run_me
    is_it_the_weekend? ? is_a_weekend : is_a_weekday
  end
end
