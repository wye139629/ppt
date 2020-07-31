Rails.application.routes.draw do
    root "pages#index"
    get "/about", to: "pages#about"
   
     
    # resources :boards do
    #     resources :posts , only: [:index, :new, :create]
    # end

    # resources :posts, except: [:index, :new, :create]

    resources :boards do
        resources :posts , shallow: true
    end

    
    
    

    # get "/" ,to: "pages#index"
end
