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
    return 'Hello world!'
  end

  get '/hello' do
    name = params[:name]

    "Hello, #{name}"
  
  end

  post '/submit' do

    name = params[:name]
    message = params[:message]

    return "Thanks #{name}, you sent this message: #{message}"
  end

end