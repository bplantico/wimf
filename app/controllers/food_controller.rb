class FoodController < ApplicationController

  def index
    conn = Faraday.new(:url => 'https://api.nal.usda.gov') do |faraday|
      faraday.params['api_key'] = ENV['data_gov_api_key']
      faraday.params['q'] = params['q']
      faraday.params['max'] = 10
      faraday.adapter Faraday.default_adapter
    end

    response = conn.get('/ndb/search/')

    @total_results = JSON.parse(response.body, symbolize_names: true)[:list][:total]
    results = JSON.parse(response.body, symbolize_names: true)[:list][:item]

    @food_results = results.map do |result|
      Food.new(result)
    end
  end
end
