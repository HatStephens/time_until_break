require 'spec_helper'

describe TimeUntilBreak do

  let(:time){TimeUntilBreak.new}

  it 'knows the current time, exact to the second' do
    expect(time.current_time).to eq Time.now.strftime("%H:%M:%S")
  end

end