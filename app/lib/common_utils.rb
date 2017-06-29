module CommonUtils

  class << self

    # calculates time in which cache will expire
    # set to midnight of current day
    def cache_expiry
      Time.zone.now.end_of_day - Time.zone.now
    end

  end

end
