require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  # Root path (homepage, index page)
  get '/' do
    return 'Hello'
  end

  get '/hello' do
    
  return erb(:index)
  
  end

  get '/names' do
    return 'Julia, Mary, Karim'
  end

  post '/submit' do

    name = params[:name]
    message = params[:message]

    return "Thanks #{name}, you sent this message: #{message}"
  end

  post '/sort_names' do
    names = params[:names]
    return names.split(',').sort.join(',')
  end

end





# diagram in diagram.codes

# alias client ="HTTP client"
# alias rackup="Rackup "
# alias app="Application class"
# alias GET="Get/ (route block)"


# client->rackup:"HTTP Request"
# rackup->app:"forwards request"
# app->GET:"Calls"
# GET->app:"Returns"
# app->rackup:"Sends response"
# rackup->client:"HTTP response"