require('sinatra')
require('pry-byebug')
require('sinatra/contrib/all')
require_relative('../models/medal')

#index
get '/medals' do 
  @medals = Medal.all
  erb(:'medals/index')
end

#new
get '/medals/new' do
  @events = Event.all
  @athletes = Athlete.all
  @medals = Medal.all
  erb(:'medals/new')
end

#create
post '/medals' do
  @medal = Medal.new(params)
  @medal.save
  erb(:'medals/create')
end