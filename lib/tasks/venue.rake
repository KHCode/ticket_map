namespace :venue do
  desc "get_venue_data"
  task :get_data => :environment do
    url = "https://app.ticketmaster.com/discovery/v2/events?apikey=#{ENV['TICKETMASTER_API_KEY']}&locale=*&sort=date,asc&countryCode=US&subGenreId=KZazBEonSMnZfZ7vFJA"
    response = RestClient.get url
    @data = JSON.parse(response)
    @venues = [{:name=>"Fiserv Forum", :tm_id=>"KovZ917A_fV"},
    {:name=>"Paycom Center", :tm_id=>"KovZpa2Wre"},
    {:name=>"Madison Square Garden", :tm_id=>"KovZpZA7AAEA"},
    {:name=>"Toyota Center - TX", :tm_id=>"ZFr9jZ7v7v"},
    {:name=>"TD Garden", :tm_id=>"KovZpa2gne"},
    {:name=>"Kaseya Center", :tm_id=>"KovZpZAJtFaA"},
    {:name=>"Smoothie King Center", :tm_id=>"ZFr9jZee1e"},
    {:name=>"Wells Fargo Center", :tm_id=>"KovZ917AiMF"},
    {:name=>"Rocket Mortgage FieldHouse", :tm_id=>"Z6r9jZ6aAe"},
    {:name=>"T-Mobile Arena", :tm_id=>"Z7r9jZaeVo"},
    {:name=>"FedExForum", :tm_id=>"KovZpZAE6vlA"},
    {:name=>"Target Center", :tm_id=>"ZFr9jZe667"},
    {:name=>"United Center", :tm_id=>"KovZpa2M7e"},
    {:name=>"Ball Arena", :tm_id=>"KovZpZAFaJeA"},
    {:name=>"Delta Center", :tm_id=>"Z6r9jZAk1e"},
    {:name=>"Moda Center", :tm_id=>"KovZpa6MXe"},
    {:name=>"Gainbridge Fieldhouse", :tm_id=>"KovZpZA6keIA"},
    {:name=>"State Farm Arena", :tm_id=>"KovZpa2Xke"},
    {:name=>"Capital One Arena", :tm_id=>"KovZpaKuJe"},
    {:name=>"Footprint Center", :tm_id=>"KovZpZAE617A"},
    {:name=>"Golden 1 Center", :tm_id=>"KovZpZAEF76A"},
    {:name=>"Kia Center", :tm_id=>"KovZpZAEvEEA"},
    {:name=>"Barclays Center", :tm_id=>"KovZ917AtP3"},
    {:name=>"Frost Bank Center", :tm_id=>"KovZpZAJJEdA"},
    {:name=>"American Airlines Center", :tm_id=>"KovZpZAJ67eA"},
    {:name=>"Spectrum Center ", :tm_id=>"KovZpZA6AEIA"},
    {:name=>"Chase Center", :tm_id=>"KovZ917Ah1H"},
    {:name=>"Crypto.com Arena", :tm_id=>"KovZpZAEdntA"},
    {:name=>"Scotiabank Arena", :tm_id=>"KovZpZAFFE1A"},
    {:name=>"Little Caesar’s Arena", :tm_id=>"KovZ917A25V"}]

    @venues.each do |venue|
      venue_id = venue[:tm_id]
      venue_url = "https://app.ticketmaster.com/discovery/v2/venues/#{venue_id}?apikey=#{ENV['TICKETMASTER_API_KEY']}"
      venue_response = RestClient.get venue_url
      venue_data = JSON.parse(venue_response)
      venue[:lat] = venue_data['location']['latitude']
      venue[:long] = venue_data['location']['longitude']
      Venue.create(name: venue[:name], tm_id: venue[:tm_id], lat: venue[:lat], long: venue[:long])
    end
  end

end
