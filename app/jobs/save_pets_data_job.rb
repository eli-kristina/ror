class SavePetsDataJob < ApplicationJob
    queue_as :default
  
    def perform(limit)
        params = {
            "page" => 1,
            "limit" => limit
        }
        
        pets = PetsService.fetch_breeds(params)
        puts "#{pets}"
    end
end