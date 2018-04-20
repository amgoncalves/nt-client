require 'typhoeus'
require 'json'

class NanoTwitter
  attr_reader :base_uri, :api_token

  @@test_uri = "localhost:4567"
  @@prod_uri = "https://sassy-nanotwitter.herokuapp.com/"

  def initialize(token)
    @api_token = token
    @base_uri = @@test_uri
  end

  # Return a nanoTwitter user if one exists, otherwise returns nil
  def find_user_by_handle(handle)
    if handle == nil
      return "Please supply a handle to GET user."
    end
    response = Typhoeus::Request.get("#{@base_uri}/api/v2/#{@api_token}/user/#{handle}")
    if response.code == 200
      JSON.parse(response.body)
    else
      nil
    end
  end
end
