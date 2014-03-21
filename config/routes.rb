InfoBytes::Application.routes.draw do

  devise_for :users

  root to: "home#index"
  match "/users/:id", to: "users#show", via: :get, as: "user"
  match '/pdf', to: "home#pdf", via: :get, as: "pdf"

  resources :tutorials do
    resources :chapters, shallow: true do 
      resources :sub_chapters do
        resources :paragraphs 
        resources :images
        resources :code_snippets
      end
    end
  end


  match "/up/:content_id/up", to: "contents#up", via: :get, as: "content_up"
  match "/down/:content_id/down", to: "contents#down", via: :get, as: "content_down"


  
end
