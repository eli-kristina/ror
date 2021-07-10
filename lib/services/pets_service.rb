class PetsService < BaseService
    @url = APP_CONFIG["service_pets"]["url"]
    @api_key = APP_CONFIG["service_pets"]["api_key"]
    
    def self.fetch_breeds(params)
        begin
            params = params.map{|k,v| "#{k}=#{v}"}
            params = params.join("&")

            raw_connection(:get, @url + "/v1/breeds?#{params}", nil, @api_key)
        rescue Exception => e
            raise "Operation failed, please try again later."
        end
    end
    
    def self.raw_connection(api_method, api_endpoint, api_params=nil, token=nil)
        resp = self.conn.send(api_method) do |req|
            req.url api_endpoint
      
            req.headers["Content-Type"]     = "application/json"
            req.headers["Accept"]           = "application/json"
            req.headers["x-api-key"]        = token if token.present?
      
            req.body = JSON::dump(api_params) if api_params.present?
        end
        
        return JSON.parse(resp.body)
    end
end