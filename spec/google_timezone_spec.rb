require 'google_timezone'

describe GoogleTimezone do
  describe 'initialize' do
    context 'without any optional parameters' do
      let(:result) { GoogleTimezone::Result.new(0) }
      before {
        allow_any_instance_of(GoogleTimezone::Base).to(
          receive(:fetch).with(no_args).and_return(result)
        )
      }

      it 'should accept separate lat/long paramenters' do
        g = GoogleTimezone.fetch(0,0)
        expect(g).to be_an_instance_of(GoogleTimezone::Result)
      end

      it 'should accept a single lat/long array parameter' do
        g = GoogleTimezone.fetch([0,0])
        expect(g).to be_an_instance_of(GoogleTimezone::Result)
      end
    end
  end

  describe '#fetch!' do
    describe 'if result is not successful' do
      let(:result) { GoogleTimezone::Result.new({}) }
      let(:error)  { GoogleTimezone::Error }

      before { allow(result).to receive(:success?).and_return(false) }
      before { allow(result).to receive(:result).and_return('error message') }
      before {
        allow_any_instance_of(GoogleTimezone::Base).to(
          receive(:fetch).and_return(result)
        )
      }

      it 'should raise an error' do
        expect { GoogleTimezone.fetch!(0,0) }.to raise_error(error)
      end
    end
  end
end
