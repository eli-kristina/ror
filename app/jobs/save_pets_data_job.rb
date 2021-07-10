class SavePetsDataJob < ApplicationJob
    queue_as :default
  
    def perform(limit)
        params = {
            "page" => 1,
            "limit" => limit
        }
        
        # call public API
        pets = PetsService.fetch_breeds(params)

        if pets.present?
            pets.each do |q|
                Cat.create({
                    name: q["name"],
                    life_span: q["life_span"],
                    origin: q["origin"],
                    temperament: q["temperament"],
                    image: q["image"]["url"],
                    hairless: q["hairless"],
                    short_legs: q["short_legs"],
                    suppressed_tail: q["suppressed_tail"]
                })
            end
        end
    end
end