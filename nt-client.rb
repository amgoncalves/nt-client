# A sample nanoTwitter client
require './NanoTwitter.rb'
require 'byebug'

api_key = ENV['NT_ACCESS_TOKEN']
nT = NanoTwitter.new(api_key)

user_handle = "mcurie"
user_id = "5acd336c31d664274e814839"
tweet_id = "5ad9dd4fea73c95e24de8f0d"

hash = nT.user.find("id", user_id)
tweet_h = nT.tweet.find_by_id(tweet_id)
recent_tweets = nT.tweet.find_most_recent()
mc_recent = nT.user.get_tweets("handle", user_handle)

def pretty_print(tweets)
  tweets.each do |num, tweet|
    puts "#{num}: #{tweet["author_handle"]} tweeted: \"#{tweet["content"]}\" on #{tweet["time_created"]}"    
  end
end


puts "#{hash["handle"]}'s email is: #{hash["email"]}" unless hash == nil
puts "#{tweet_h["author_handle"]} tweeted: \"#{tweet_h["content"]}\" on #{tweet_h["time_created"]}" unless tweet_h == nil

nT.tweet.pretty_print(recent_tweets)
nT.tweet.pretty_print(mc_recent)
