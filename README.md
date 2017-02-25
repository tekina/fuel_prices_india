# README

Get latest fuel prices for major cities in India.

Give it a go at: http://fuelpriceindia.herokuapp.com/

API available for fetching fuel price:

url: `http://fuelpriceindia.herokuapp.com`

1. Fetch available cities list:

  `GET /main/city_list`
  
  Returns a list of cities for which fuel prices are available
  
  response: `{ cities: ["Bengaluru", Pune, Mumbai, ..., Nagpur] }`
  
  
2. Fetch fuel price for a city:

   `GET /main/{city_name}/{fuel_type}/price`
   
   a. `city_name` can be any city from the list obtained in the `GET city_list` API call.
   
   b. `fuelType`: `petrol` or `diesel`
   
    Sample endpoint: `GET /main/mumbai/petrol/price`
    
    response: `{ city: {city_name}, price: {fuel_price} }`
