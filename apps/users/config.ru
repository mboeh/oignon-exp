require 'sinatra/base'
require 'redis'
require 'json'

REDIS = Redis.new(url: ENV["REDIS_PORT"])

class App < Sinatra::Base

  get "/env" do
    ENV.inspect
  end

  get "/users/:user_id" do |user_id|
    redis.get(user_id)
  end

  put "/users/:user_id" do |user_id|
    redis.set(user_id, request.body.read)
  end

  private

  def redis
    REDIS
  end

end

run App
