require 'sinatra/base'
require 'redis'
require 'json'

REDIS = Redis.new(url: ENV["REDIS_PORT"])

class App < Sinatra::Base

  get "/users/:user_id/auth/:token" do |user_id, token|
    if redis.sismember("tokens:#{user_id}", token)
      redis.get("users:#{user_id}")
    else
      status 401
    end
  end

  get "/users/:user_id" do |user_id|
    redis.get("users:#{user_id}")
  end

  put "/users/:user_id" do |user_id|
    redis.set("users:#{user_id}", request.body.read)
  end

  # XXX: obviously insecure
  put "/users/:user_id/password" do |user_id|
    body = JSON.parse(request.body.read)
    redis.set("passwords:#{user_id}", body["password"])
  end

  post "/users/:user_id/login" do |user_id|
    body = JSON.parse(request.body.read)
    if redis.get("passwords:#{user_id}") == body["password"]
      redis.sadd("tokens:#{user_id}", token = SecureRandom.hex)
      { token: token }.to_json
    else
      status 401
    end
  end

  private

  def redis
    REDIS
  end

end

run App
