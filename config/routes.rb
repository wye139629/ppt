Rails.application.routes.draw do
    
    resources :boards
    root "pages#index"
    get "/about", to: "pages#about"

    # get "/" ,to: "pages#index"
end
