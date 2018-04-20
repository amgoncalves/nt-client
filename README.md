# nanoTwitter Client Library

[nanoTwitter (nT)](https://github.com/amgoncalves/sassy-twitter) is a minimal version of [Twitter](https://twitter.com/) built on [Sinatra](http://sinatrarb.com/).  This client library provides tools to interface with the nanoTwitter API.

## Example

```
api_token = ENV['NT_ACCESS_TOKEN']
nT = NanoTwitter.new(api_token)
user_handle = "mcurie"
hash = nT.find_user_by_handle(user_handle)
puts "#{user_handle}'s email is: #{hash["email"]}"
```

## Authors

Si Chen, Alyssa Goncalves, Shuai Yu

COSI-105b Software Engineering for Scalability

Brandeis University, Spring 2018
