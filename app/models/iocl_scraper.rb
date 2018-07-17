class IoclScraper

  BASE_URL = 'https://www.iocl.com/Products'

  ENDPOINTS = {
                'petrol' => '/Gasoline.aspx',
                'diesel' => '/HighSpeedDiesel.aspx'
              }

  def self.current_prices(fuel_type)
    Rails.logger.info 'Fetching web page...'
    response_html = HTTParty.get(BASE_URL + ENDPOINTS[fuel_type])
    tokenized_page = Nokogiri::HTML(response_html)
    price_hash = {}

    # Metro, NCR prices
    Rails.logger.info 'Parsing price for metro cities and NCR...'
    tokenized_page.xpath('//table[@class="wrapper-table"]/tbody/tr/td/table[1]/tr').each do |row|
      price_hash[row.xpath('td[1]').text] = row.xpath('td[2]').text.to_f
    end

    # State Capitals prices
    Rails.logger.info 'parsing price for state capitals...'
    tokenized_page.xpath('//table[@class="wrapper-table"]').xpath('tbody/tr/td/div/table').children.each do |row| 
      next if row.xpath('td[1]').text.blank?
      price_hash[row.xpath('td[1]').text] = row.xpath('td[2]').text.to_f
    end

    return price_hash
  end

end
