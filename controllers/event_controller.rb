require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/athlete')
require_relative('../models/nation')
require_relative('../models/event')

#index
get '/events' do
  @nations = Nation.all
  @events = Event.all
  erb(:'events/index')
end

#new
get '/events/new' do
  erb(:'events/new')
end

#show
get '/events/:id' do
  @event = Event.find(params[:id])
  erb(:'events/show')
end

#edit
get '/events/:id/edit' do
  @event = Event.find(params[:id])
  erb(:'events/edit')
end

#create
post '/events' do
  @event = Event.new(params)
  @event.save
  erb(:'events/create')
end

post '/events/:id' do
  @event = Event.update(params)
  redirect to ("/events/#{params[:id]}")
end

post '/events/:id/delete' do
  Event.delete(params[:id])
  redirect to ("/events")
end
