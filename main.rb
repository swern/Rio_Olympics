require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/nation_controller')
require_relative('controllers/athlete_controller')
require_relative('controllers/event_controller')
require_relative('controllers/medal_controller')
require_relative('controllers/rankings_controller')

get '/' do
  erb :home
end