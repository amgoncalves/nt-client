require 'typhoeus'
require 'json'

class User
  def initialize(client)
    @NT = client
  end

  def find(type, key)
    return nil unless key != nil && type != nil
    request = Typhoeus::Request.new(
      "#{@NT.base_uri}/api/v1/#{@NT.api_token}/users/#{key}",      
      method: :get,
      params: { input_type: type }
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

  # Returns a nanoTwitter user's most recent tweets if one exists with the given id
  def get_tweets(type, key)
    return nil unless key != nil && type != nil
    request = Typhoeus::Request.new(
      "#{@NT.base_uri}/api/v1/#{@NT.api_token}/users/#{key}/tweets",
      method: :get,
      params: { input_type: type }
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

  def get_followers(id)
    request = Typhoeus::Request.new(
      "#{@NT.base_uri}/api/v1/#{@NT.api_token}/users/#{id}/followers",
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

  def get_following(id)
    request = Typhoeus::Request.new(
      "#{@NT.base_uri}/api/v1/#{@NT.api_token}/users/#{id}/following",
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

  def follow(id)
    request = Typhoeus::Request.new(
      "#{@NT.base_uri}/api/v1/#{@NT.api_token}/users/#{id}/follow",
      method: :post,
      params: { targeted_id: id }
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

  def unfollow(id)
    request = Typhoeus::Request.new(
      "#{@NT.base_uri}/api/v1/#{@NT.api_token}/users/#{id}/unfollow",
      method: :post,
      params: { targeted_id: id }
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
