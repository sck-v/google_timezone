require 'google_timezone'

describe GoogleTimezone do
  describe 'initialize' do
    before { GoogleTimezone::Base.any_instance.should_receive(:fetch).with(no_args).and_return(GoogleTimezone::Result.new(0)) }

    it 'correct with separate lat and lon' do
      g = GoogleTimezone.fetch(0,0)
      g.should be_an_instance_of(GoogleTimezone::Result)
    end

    it 'correct with array lat and lon' do
      g = GoogleTimezone.fetch([0,0])
      g.should be_an_instance_of(GoogleTimezone::Result)
    end
  end

  describe '#fetch!' do
    describe 'if result is not success' do
      let(:result) { GoogleTimezone::Result.new({}) }

      before { result.stub!(:success?) { false } }
      before { result.stub!(:result) { 'error message' } }
      before { GoogleTimezone::Base.any_instance.stub(:fetch) { result } }

      it 'should raise error' do
        expect { GoogleTimezone.fetch!(0,0) }.to raise_error(GoogleTimezone::Error)
      end
    end
  end
end
