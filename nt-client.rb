# A sample nanoTwitter client
require './NanoTwitter.rb'
require 'byebug'

api_key = ENV['NT_ACCESS_TOKEN']
nT = NanoTwitter.new(api_key)

user_handle = "mcurie"
user_id = "5acd336c31d664274e814839" #mcurie
user_id2 = "5ace46f331d6643caa208479" #tlockheart
tweet_id = "5ad9dd4fea73c95e24de8f0d"

=begin
hash = nT.get_user("id", user_id)
puts "#{hash["handle"]}'s email is: #{hash["email"]}" unless hash == nil

tweet_h = nT.get_tweet(tweet_id)
puts "#{tweet_h["author_handle"]} tweeted: \"#{tweet_h["content"]}\" on #{tweet_h["time_created"]}" unless tweet_h == nil



recent_tweets = nT.get_recent_tweets
pretty_print(recent_tweets)

=end

def pretty_print(tweets)
  tweets.each do |num, tweet|
    puts "#{num}: #{tweet["author_handle"]} tweeted: \"#{tweet["content"]}\" on #{tweet["time_created"]}"    
  end
end

#puts nT.tweet("Hello, world!")
#puts nT.reply("5acd33a131d664274e81485f", "It's a reply :D.")
#puts nT.retweet("5acd33a131d664274e81485f", "It's a retweet :D.")
#user_recent = nT.get_user_tweets("handle", "mcurie")
#pretty_print(user_recent)

#puts nT.get_followers(user_id)
#puts nT.unfollow(user_id2)
#puts nT.get_followers(user_id2)

#puts nT.find_users("curie")
puts nT.find_tweets("ipsum")
