require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/nation')

#index
get '/nations' do
  @nations = Nation.all
  erb(:'nations/index')
end

#new
get '/nations/new' do
  erb(:'nations/new')
end

#show
get '/nations/:id' do
  @nation = Nation.find(params[:id])
  erb(:'nations/show')
end

#edit
get '/nations/:id/edit' do
  @nation = Nation.find(params[:id])
  erb(:'nations/edit')
end

#create
post '/nations' do
  @nation = Nation.new(params)
  @nation.save
  erb(:'nations/create')
end

post '/nations/:id' do
  @nation = Nation.update(params)
  redirect to ("/nations/#{params[:id]}")
end

post '/nations/:id/delete' do
  Nation.delete(params[:id])
  redirect to ("/nations")
end


