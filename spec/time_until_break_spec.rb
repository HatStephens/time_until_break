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
    time_two = TimeUntilBreak.new("14:30:00")
    expect(time_two.break_time.strftime("%H:%M:%S")).to eq "14:30:00"
  end

  xit 'knows if the break has been yet' do
    expect(time.has_break_been?).to eq false
  end

  xit 'can calculate how long until the next break in hours and minutes' do
    expect(time.message).to eq "6 hours, 50 minutes"
  end

end