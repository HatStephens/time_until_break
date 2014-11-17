require 'spec_helper'

describe TimeUntilBreak do

  let(:time){TimeUntilBreak.new}

  it 'knows the current time, exact to the second' do
    expect(time.current_time).to eq Time.now.strftime("%H:%M:%S")
  end

  it 'knows what time the Mandatory Break is' do
    expect(time.break_time).to eq "16:45:00"
  end

  it 'can have a new break time set' do
    time_two = TimeUntilBreak.new("14:30:00")
    expect(time_two.break_time).to eq "14:30:00"
  end

end