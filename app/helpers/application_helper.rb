module ApplicationHelper
  require 'net/http'
  include StudentsHelper

  def twitter
    access_token = prepare_access_token("1847795930-bl35P2n8IUFFGAJSttzIXc0p8JlLwalgd9HvSKC", "lS60IJYHZIhYpO9DSH8N4nmN0ekxMVceTR53BeC3XNk")
    response = access_token.request(:get, "https://api.twitter.com/1.1/users/show.json?screen_name=242chalkboard")
    
    followers = JSON.parse(response.body)['followers_count']
  end
 
  def prepare_access_token(oauth_token, oauth_token_secret)
    consumer = OAuth::Consumer.new("lQxjcipUgyFOGk6VezDkg", "D0TtEkkXstaK3ZVshyE9DXSafOi2ecBPZs8SxxjvR8",
      { :site => "http://api.twitter.com",
        :scheme => :header
      })
    token_hash = { :oauth_token => oauth_token,
                 :oauth_token_secret => oauth_token_secret
               }
    access_token = OAuth::AccessToken.from_hash(consumer, token_hash )
    return access_token
  end
 
  def facebook
    
    #uri = URI("http://graph.facebook.com/242chalkboard")
    #data = Net::HTTP.get(uri)
    #likes = JSON.parse(data)['likes']
    return 7
  end

  def google
    require 'curb'
    require 'json'
    hash =  {method: "pos.plusones.get",id: "p",params: {nolog: true, id: "http://www.tomanthony.co.uk/", source: "widget", userId: "@viewer", groupId: "@self"}, jsonrpc: "2.0", key: "p", apiVersion: "v1"} 
    
    result=(Curl::Easy.http_post("https://clients6.google.com/rpc?key=AIzaSyBT8uIq_IZm4hIBRvkAfBjBsTpMq8CjpA0", 
    hash.to_json) do |curl|
      curl.headers['Accept']='application/json'
      curl.headers['Content-Type']='application/json'
      curl.headers['Api-Version']='2.2'
    end)
    

    result=JSON.parse(result.body_str)

    count = result && result['result'] && result['result']['metadata'] && result['result']['metadata']['globalCounts'] && result['result']['metadata']['globalCounts']['count'] ? result['result']['metadata']['globalCounts']['count'].to_i : 0
  
  end

  def correct_value(correct,incorrect)
      total= correct + incorrect
      per = correct.to_f/total*100*2
      return per
  end
  

end
