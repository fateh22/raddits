Rails.application.routes.draw do
  resources :messages do 
    member do 
        put  'userchats', to: "messages#user_chats"
      end
  end
  resources :friends do 
      member do
        put "request", to: "friends#friends_request"
        delete "cancel", to: "friends#friends_request_cancel"
       patch "confirm", to: "friends#friends_confirm"
      end

      collection do 
        get  'myfriends'
      end
     
  end 
  resources :photos do
    member do
      put "cover" , to: "photos#cover_image"
      put "cover_popup", to: "photos#cover_popup"
      put "profileimage", to: "photos#profile_photo"

    end
    
  end
  resources :profile
  resources :comments
  devise_for :users, controllers: {
                                   sessions: 'users/sessions'
                                   }   
    

  resources :users do 
    resources :profile do
    collection do
        patch 'update_password'
        patch 'update_email'
        get  'dashboard'
        delete 'user_destroy'

      end
    end
    
  end


  namespace :api do 
    namespace :v1 do 

        resources :sessions
        resources :links                             
    end 
  end 

  resources :links do
    	member do
    		put "like" , to: "links#upvote"
    		put "dislike", to: "links#downvote" 
    	end
    resources :comments
  end
  root 'links#index'
  resources :high_scores
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
