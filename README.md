# GoogleTimezone

Small gem to get timezone info by known coordinates using google timezone api.

## Installation

Add this line to your application's Gemfile:

    gem 'google_timezone'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install google_timezone

## Usage

You can pass latitude and longitude to gem in several ways: with array or separated values.

    GoogleTimezone.fetch([latitude, longitude]) 
    GoogleTimezone.fetch(latitude, longitude) 
    
Any other options which are described in google's documentation you can pass via options hash

    GoogleTimezone.fetch(latitude, longitude, language: 'en', signature: 'key')

It uses latitude and longitude to retrieve timezone info.

    result = GoogleTimezone.fetch(50.1196004, 8.679918299999999)
    result.time_zone_name => 'Europe/Berlin'

It will get `GoogleTimezone::Result` object which maps major google api responce items named in snake case.
More information [here](https://developers.google.com/maps/documentation/timezone/)
Also there is `GoogleTimezone::Result#success?` method. It returns true if responce was successful.

The bang version `fetch!` raises an `GoogleTimezone::Error` exception with error message if response from Google wasn't success.


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
