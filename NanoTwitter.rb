require 'typhoeus'
require 'json'
require './user.rb'
require './tweet.rb'

class NanoTwitter
  attr_reader :base_uri, :api_token, :user, :tweet

  @@test_uri = "localhost:4567"
  @@prod_uri = "https://sassy-nanotwitter.herokuapp.com/"

  def initialize(token)
    @api_token = token
    @base_uri = @@test_uri
    @user = User.new(self)
    @tweet = Tweet.new(self)
  end

  def get_tweet(id)
    @tweet.get_tweet(id)
  end

  def get_recent_tweets
    @tweet.get_recent_tweets
  end
  
  def tweet(msg)
    @tweet.tweet(msg)
  end

  def get_user(type, key)
    @user.find(type, key)
  end

  def get_user_tweets(type, key)
    @user.get_tweets(type, key)
  end
end
