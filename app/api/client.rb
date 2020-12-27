require 'rest-client'
require 'json'

class Client

    def initialize()
        @base_url = '//authentication:4000/api'
    end

    def login(email, password)
        resp = RestClient.post "#{@base_url}"+"/users/signin", {'email' => email, 'password' => password}.to_json, {content_type: :json, accept: :json}

        JSON.parse(resp.body)
    end

    def create_user(name, email, password)
        resp = RestClient.post "#{@base_url}" + "/users", {'name' => name, 'email' => email, 'password' => password}.to_json, {content_type: :json, accept: :json}

        JSON.parse(resp.body)
    end

    def generate_token()
        resp = RestClient.get "#{@base_url}" + "/generatetoken"

        JSON.parse(resp.body)
    end 
end
