require 'google_timezone/version'
require 'google_timezone/base'
require 'google_timezone/result'

module GoogleTimezone
  class << self
    def fetch(*args)
      Base.new(*args).fetch
    end

    def fetch!(*args)
      Base.new(*args).fetch!
    end

    def set_default_stub(default_stub)
      Base.default_stub = default_stub
    end
  end
end
