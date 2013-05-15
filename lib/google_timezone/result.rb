
module GoogleTimezone
  class Result
    def initialize(result)
      @result = result
    end

    def raw
      @result
    end

    def success?
      @result['status'].eql?('OK')
    end

    def dst_offset
      @result.fetch('dstOffset',0)
    end

    def raw_offset
      @result.fetch('rawOffset',0)
    end

    def time_zone_id
      @result.fetch('timeZoneId','')
    end

    def time_zone_name
      @result.fetch('timeZoneName','')
    end

    def result
      @result.fetch('result','')
    end
  end
end