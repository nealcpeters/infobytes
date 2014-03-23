InfoBytes::Application.routes.draw do

  devise_for :users

  root to: "home#index"
  match "/users/:id", to: "users#show", via: :get, as: "user"
  match '/pdf', to: "home#pdf", via: :get, as: "pdf"
  match '/about', to: "home#about", via: :get, as: "about"

  get '/topics', to: "topics#index", as: "topics"
  get '/topics/:id', to: "topics#show", as: "topic"
  get '/subtopics', to: "subtopics#index", as: "subtopics"
  get '/subtopics/:id', to: "subtopics#show", as: "subtopic"


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
