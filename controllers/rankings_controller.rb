require('sinatra')
require('pry-byebug')
require('sinatra/contrib/all')
require_relative('../models/ranking')

get '/rankings' do
  @ranking = Ranking.new
  erb(:rankings)
end