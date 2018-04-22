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

  def reply(tweet_id, msg)
    @tweet.reply(tweet_id, msg)
  end

  def retweet(tweet_id, msg)
    @tweet.retweet(tweet_id, msg)
  end

  def get_user(key_type, key)
    @user.find(key_type, key)
  end

  def get_user_tweets(key_type, key)
    @user.get_tweets(key_type, key)
  end

  def get_followers(id)
    @user.get_followers(id)
  end

  def get_following(id)
    @user.get_following(id)
  end

  def follow(id)
    @user.follow(id)
  end

  def unfollow(id)
    @user.unfollow(id)
  end
end
