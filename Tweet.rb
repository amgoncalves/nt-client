require 'typhoeus'
require 'json'

class Tweet
  def initialize(client)
    @NT = client
  end
  
  # Return a nanoTwitter tweet if one exists under the given id, otherwise returns nil
  def find_by_id(id)
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

  def find_most_recent
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
end
