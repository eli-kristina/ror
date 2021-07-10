class BaseService
    @url = ""
    @verify_ssl = true
    
    def self.conn
        raise "Need to set @url" if @url.blank?

        Faraday.new(:url => @url, :ssl => {:verify => @verify_ssl}) do |builder|
            builder.request  :url_encoded
            builder.response :logger
            builder.adapter  :net_http
        end
    end
end