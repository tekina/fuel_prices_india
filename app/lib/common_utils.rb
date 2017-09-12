module CommonUtils

  PRICE_REFRESH_HOUR = 6

  class << self

    # calculates the remaining time in which cache will expire
    # set to 6 AM everyday
    def cache_expiry
      time = Time.zone.now.end_of_day + PRICE_REFRESH_HOUR.hours
      time -= 1.day if Time.zone.now.hour < PRICE_REFRESH_HOUR
      return time - Time.zone.now
    end

  end

end
