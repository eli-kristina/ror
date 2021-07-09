Rails.application.routes.draw do
  root "home#index"
  
  # List all API's
  namespace "api" do
    # API that related to users activity
    scope "users" do
      post "login", action: 'get_api_key'
      post "create", action: 'create_user'
    end

    # API that related to breeds
    get "breeds", action: 'list_breeds'
    post "breeds", action: 'create_breeds'
    put "breeds/:id", action: 'update_breeds'
    delete "breeds/:id", action: 'delete_breeds'

    # API that related to votes
    get "votes", action: 'get_votes'
    post "votes", action: 'create_votes'

    # API that related to favourites
    get "favourites", action: 'get_favourites'
    post "favourites", action: 'create_favourites'
  end
end
