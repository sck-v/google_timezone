require 'google_timezone'

describe GoogleTimezone do
  let(:raw_result) { {} }

  before do
    allow_any_instance_of(GoogleTimezone::Base).to(
      receive(:get_result).and_return(raw_result)
    )
  end

  describe '.fetch' do
    context 'without any optional parameters' do
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
      let(:valid_params)   { { timestamp: 1331161200,
                               key: 'A24br8v2w' } }
      let(:invalid_params) { { timestamp: 1331161200,
                               key: 'A24br8v2w',
                               unallowed_param: true } }

      it 'should pass allowed parameters on to the query' do
        g = GoogleTimezone.fetch(0, 0, valid_params)
        expect(g).to be_an_instance_of(GoogleTimezone::Result)
      end

      it 'should reject unallowed parameters' do
        a_hash_excluding = ->(*keys) { satisfy {|actual| (keys & actual.keys).empty? } }
        expect_any_instance_of(GoogleTimezone::Base).to receive(:get_result).with(a_hash_excluding[:unallowed_param])
        g = GoogleTimezone.fetch(0, 0, invalid_params)
        expect(g).to be_an_instance_of(GoogleTimezone::Result)
      end
    end
  end

  describe '.fetch!' do
    describe 'if result is not successful' do
      it 'should raise an error' do
        expect { GoogleTimezone.fetch!(0, 0) }.to raise_error(GoogleTimezone::Error)
      end
    end

    describe 'if result is successul' do
      let(:raw_result) { {'status' => 'OK'} }

      it 'should return a result' do
        g = GoogleTimezone.fetch!(0, 0)
        expect(g).to be_an_instance_of(GoogleTimezone::Result)
      end
    end
  end
end
