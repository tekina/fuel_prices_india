class FuelPriceScraper

  URL = "http://www.mypetrolprice.com"

  def self.get_fuel_price(city, city_id, fuel_type)
    begin
      Rails.logger.info "Fetching #{fuel_type} price for #{city}"
      Rails.logger.info "Endpoint: #{URL}/#{city_id}/#{fuel_type}-price-in-#{city}"
      response_html = HTTParty.get("#{URL}/#{city_id}/#{fuel_type}-price-in-#{city}")
      if response_html.success?
        Rails.logger.info "Successfully fetched #{fuel_type} price for #{city}"
        parsed_page = Nokogiri::HTML(response_html)
        return parsed_page.at_css('[class="UCPrice"]').children.to_s.strip.delete("^.0-9").to_f.round(2)
      else
        raise HTTParty::Error("Received a non 200 response")
      end
    rescue NoMethodError, HTTParty::Error => e
      msg = "Unable to fetch #{fuel_type} price for #{city} with exception: #{e.message}"
      Rails.logger.error msg
      return nil
    end
  end

end
