require 'sinatra/base'
require 'json'

class App < Sinatra::Base

  get "/" do
    user = JSON.parse(params[:_user]) unless params[:_user].nil? or params[:_user].empty?
    if user and user['user']
      name = user['user']['name']
      "Hello, #{name}!"
    else
      "Who are you?"
    end
  end

end

run App
