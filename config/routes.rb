Rails.application.routes.draw do
    root "pages#index"
    get "/about", to: "pages#about"
   


    namespace :api do 
      namespace :v2 do
        resources :boards, only:[:index]
      end
    end
     
    # resources :boards do
    #     resources :posts , only: [:index, :new, :create]
    # end

    # resources :posts, except: [:index, :new, :create]

    


    resources :boards do
        member do
            post :favorite
        end
        resources :posts , shallow: true do
            resources :comments, shallow: true, only:[:create]
        end
    end

    resources :users, only: [:create] do
        collection do
            get :sign_up
            get :edit
            patch :update
            get :sign_in
            post :login
            delete :sign_out
        end
    end

    resources :favorites, only: [:index]
    # except: [:show,:edit, :new, :create ]
    
    

    # get "/" ,to: "pages#index"
end
