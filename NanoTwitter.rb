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
end
