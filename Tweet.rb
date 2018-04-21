require 'typhoeus'
require 'json'

class Tweet
  def initialize(client)
    @NT = client
  end
  
  # Return a nanoTwitter tweet if one exists under the given id, otherwise returns nil
  def get_tweet(id)
    return nil unless id != nil
    request = Typhoeus::Request.new(
      "#{@NT.base_uri}/api/v1/#{@NT.api_token}/tweets/#{id}",
      method: :get
    )
    request.on_complete do |response|
      if response.success?
        return JSON.parse(response.body)
      else
        return nil
      end
    end

    request.run    
  end

  def get_recent_tweets
    request = Typhoeus::Request.new(
      "#{@NT.base_uri}/api/v1/#{@NT.api_token}/tweets/recent",
      method: :get
    )
    request.on_complete do |response|
      if response.success?
        return JSON.parse(response.body)
      else
        return nil
      end
    end

    request.run 
  end

  def tweet(msg)
    request = Typhoeus::Request.new(
      "#{@NT.base_uri}/api/v1/#{@NT.api_token}/tweets/new",
      method: :post,
      params: { tweet: { content: msg } }
    )
    request.on_complete do |response|
      if response.success?
        if response.body == ""
          return nil
        else
          return JSON.parse(response.body)
        end
      else
        return nil
      end
    end

    request.run     
  end
end
