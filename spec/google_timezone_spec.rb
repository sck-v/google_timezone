require 'google_timezone'

describe GoogleTimezone do
  describe 'initialize' do
    it 'correct with separate lat and lon' do
      g = GoogleTimezone::Base.new(0,0)
      g.should be_an_instance_of(GoogleTimezone::Base)
    end

    it 'correct with array lat and lon' do
      g = GoogleTimezone::Base.new([0,0])
      g.should be_an_instance_of(GoogleTimezone::Base)
    end
  end
end
