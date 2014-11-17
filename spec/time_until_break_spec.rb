require 'spec_helper'

describe TimeUntilBreak do

  let(:time){TimeUntilBreak.new}

  it 'knows the current time, exact to the second' do
    expect(time.current_time).to eq Time.now.strftime("%H:%M:%S")
  end

  it 'knows what time the Mandatory Break is' do
    expect(time.break_time).to eq "16:45:00"
  end

end