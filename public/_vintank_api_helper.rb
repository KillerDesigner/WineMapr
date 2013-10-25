# require 'digest/md5'
# require 'rubygems'
# require 'httparty'

# class Cruvee
#   include HTTParty
#   base_uri "http://apiv1.cruvee.com"

#   def initialize(appId, secret)
#     @appId = appId
#     @secret = secret
#   end

#   def get(uri)
#     timestamp = Time.now.to_i * 1000
#     url_params = {:appId => @appId, :sig => calcSig(timestamp, uri), :timestamp => timestamp.to_s, :fmt => "json" }
#     return self.class.get(uri, :query => url_params)
#   end

#   def query(uri, q)
#     timestamp = Time.now.to_i * 1000
#     url_params = {:q => q, :fmt => "json", :appId => @appId, :sig => calcSig(timestamp, uri), :timestamp => timestamp.to_s}
#     return self.class.get(uri, :query => url_params)
#   end

#   private

#   def calcSig(timestamp, uri)
#     sigSource = @appId + "\n" + "GET" + "\n" + @secret + "\n" + timestamp.to_s + "\n" + uri + "\n"
#     return Digest::MD5.hexdigest(sigSource.downcase)
#   end
# end

# cruvee = Cruvee.new("[YOUR APPID HERE]", "[YOUR SECRET HERE]")

# puts cruvee.get("/regions/8400075.js")
# puts cruvee.query("/search/varieties", "merlot")