require 'sinatra/base'

class App < Sinatra::Base

  get "/" do
    "Hello, Ruby!"
  end

end

run App
