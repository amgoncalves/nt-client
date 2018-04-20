# A sample nanoTwitter client
require './NanoTwitter.rb'
require 'byebug'

api_key = "mcurie"

nT = NanoTwitter.new(api_key)
user_handle = "mcurie"
user_id = "5acd336c31d664274e814839"
hash = nT.find_user_by_id(user_id)
#hash = nT.find_user_by_handle(user_handle)
puts "#{hash["handle"]}'s email is: #{hash["email"]}" unless hash == nil
