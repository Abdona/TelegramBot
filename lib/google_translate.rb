require 'uri'
require 'net/http'
require 'json'
require 'openssl'
class Translate
  def initialize
    @url = URI('https://translation.googleapis.com/language/translate/v2')
    @http = Net::HTTP.new(@url.host, @url.port)
    @http.use_ssl = true
    @http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    @request = Net::HTTP::Post.new(@url)
  end

  def to_german(param)
    @request.body = "q=#{param}&source=en&target=de&key=AIzaSyAsR5nw3vAr2PDYo0HJ1G79OGUkRGOa_wE"
    @response = @http.request(@request)
    @response_json = JSON.parse(@response.read_body)['data']['translations'][0]['translatedText']
    @response_json
  end
end