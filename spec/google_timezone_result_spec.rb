require 'google_timezone/result'

describe GoogleTimezone::Result do
  it 'should be success' do
    result = GoogleTimezone::Result.new({ 'status' => 'OK' })
    result.should be_success
  end

  it 'should not be succsess' do
    result = GoogleTimezone::Result.new({ 'status' => 'ZERO_RESULTS' })
    result.should_not be_success
  end
end