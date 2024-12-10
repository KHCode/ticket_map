require 'rest-client'
class HomeController < ApplicationController
  def index
    url = "https://app.ticketmaster.com/discovery/v2/events?apikey=#{ENV['TICKETMASTER_API_KEY']}&locale=*&startDateTime=2024-12-11T13:26:00Z&endDateTime=2024-12-14T23:26:00Z&sort=date,asc&countryCode=US&subGenreId=KZazBEonSMnZfZ7vFJA"
    response = RestClient.get url
    @data = JSON.parse(response)
    @nba_games_with_dates = @data.first[1]['events'].map{|e| {name: e['name'], date: e['dates']['start']['dateTime']}}
    # binding.pry
  end
end
