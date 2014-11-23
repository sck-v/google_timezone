require 'google_timezone'

describe GoogleTimezone do
  describe '.fetch' do
    context 'without any optional parameters' do
      let(:base_instance) { spy }
      let(:result) { GoogleTimezone::Result.new({}) }

      before do
        allow_any_instance_of(GoogleTimezone::Base).to(
          receive(:new).with(any_args)
                       .and_return(base_instance)
        )

        allow(base_instance).to(
          receive(:fetch).with(no_args)
                         .and_return(result)
        )
      end

      it 'should accept separate lat/long paramenters' do
        g = GoogleTimezone.fetch(0, 0)
        expect(g).to be_an_instance_of(GoogleTimezone::Result)
      end

      it 'should accept a single lat/long array parameter' do
        g = GoogleTimezone.fetch([0, 0])
        expect(g).to be_an_instance_of(GoogleTimezone::Result)
      end
    end

    context 'with optional parameters' do
      let(:base_instance) { spy }
      let(:result) { GoogleTimezone::Result.new(0) }
      let(:valid_params)   { { timestamp: 1331161200,
                               key: 'A24br8v2w' } }
      let(:invalid_params) { { timestamp: 1331161200,
                               key: 'A24br8v2w',
                               unallowed_param: true } }

      before(:each) do
        allow_any_instance_of(GoogleTimezone::Base).to(
          receive(:new).with(0, 0, valid_params)
                       .and_return(base_instance)
        )

        allow(base_instance).to(
          receive(:fetch).with(no_args)
                         .and_return(result)
        )
      end

      it 'should pass allowed parameters on to the query' do
        g = GoogleTimezone.fetch(0, 0, valid_params)
        expect(g).to be_an_instance_of(GoogleTimezone::Result)
      end

      it 'should reject unallowed parameters' do
        g = GoogleTimezone.fetch(0, 0, invalid_params)
        expect(g).to be_an_instance_of(GoogleTimezone::Result)
      end
    end
  end

  describe '.fetch!' do
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
