require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/athlete')
require_relative('../models/nation')
require_relative('../models/medal')

#index
get '/athletes' do
  @athletes = Athlete.all
  erb(:'athletes/index')
end

#new
get '/athletes/new' do
  @nations = Nation.all
  @events = Event.all
  @medals = Medal.all
  erb(:'athletes/new')
end

#show
get '/athletes/:id' do
  @athlete = Athlete.find(params[:id])
  erb(:'athletes/show')
end

#edit
get '/athletes/:id/edit' do
  @athlete = Athlete.find(params[:id])
  erb(:'athletes/edit')
end

#create
post '/athletes' do
  @athlete = Athlete.new(params)
  @athlete.save
  erb(:'athletes/create')
end

post '/athletes/:id' do
  @athlete = Athlete.update(params)
  redirect to ("/athletes/#{params[:id]}")
end

post '/athletes/:id/delete' do
  Athlete.delete(params[:id])
  redirect to ("/athletes")
end