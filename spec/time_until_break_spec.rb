require 'spec_helper'

describe TimeUntilBreak do

  let(:time){TimeUntilBreak.new}

  it 'knows the current time, exact to the minute' do
    expect(time.current_time.strftime("%H:%M")).to eq Time.now.strftime("%H:%M")
  end

  it 'knows what time the Mandatory Break is' do
    expect(time.break_time.strftime("%H:%M")).to eq "16:45"
  end

  it 'can have a new break time set' do
    time_two = TimeUntilBreak.new("14:30:00", "14:45:00")
    expect(time_two.break_time.strftime("%H:%M:%S")).to eq "14:30:00"
  end

  it 'knows if the break has been missed' do
    Delorean.time_travel_to(Time.utc(2014,11,17,22,45))
    expect(time.has_break_been?).to eq true
  end

  it 'knows if the break has not been missed' do
    Delorean.time_travel_to(Time.utc(2014,11,17,10,34))
    expect(time.has_break_been?).to eq false
  end

  it 'can calculate how long until the next break in hours and minutes' do
    Delorean.time_travel_to(Time.utc(2014,11,17,10,36))
    expect(time).to receive(:`).with('say "6 hours, 9 minutes until the Mandatory Break."')
    time.run_me
  end

  it 'knows if it is not the weekend' do
    Delorean.time_travel_to(Time.utc(2014,11,21,10,36))
    expect(time.is_it_the_weekend?).to be false
  end

  it 'knows if it is the weekend' do
    Delorean.time_travel_to(Time.utc(2014,11,22,10,36))
    expect(time.is_it_the_weekend?).to be true
  end

  it 'knows if it is break time when called' do
    Delorean.time_travel_to(Time.utc(2014,11,21,16,50))
    expect(time).to receive(:`).with('say "Get your shizzle on, it\'s break time right now. All around the world."')
    time.run_me
  end

end