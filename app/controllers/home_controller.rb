require 'rest-client'
class HomeController < ApplicationController
  def index
    url = "https://app.ticketmaster.com/discovery/v2/events?apikey=#{ENV['TICKETMASTER_API_KEY']}&locale=*&startDateTime=2024-12-11T13:26:00Z&endDateTime=2024-12-14T23:26:00Z&sort=date,asc&countryCode=US&subGenreId=KZazBEonSMnZfZ7vFJA"
    response = RestClient.get url
    @data = JSON.parse(response)
    @nba_games_with_dates = @data.first[1]['events'].map{|e| {name: e['name'], date: e['dates']['start']['dateTime'], url: e['url'], venue: {name: e['_embedded']['venues'][0]['name'], id: e['_embedded']['venues'][0]['id']}}}
    @nba_games_with_dates.each do |game|
      venue_id = game[:venue][:id]
      venue_url = "https://app.ticketmaster.com/discovery/v2/venues/#{venue_id}?apikey=#{ENV['TICKETMASTER_API_KEY']}"
      venue_response = RestClient.get venue_url
      venue_data = JSON.parse(venue_response)
      game[:venue][:lat] = venue_data['location']['latitude']
      game[:venue][:long] = venue_data['location']['longitude']
    end
  end
end
