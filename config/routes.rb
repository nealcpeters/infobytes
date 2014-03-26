InfoBytes::Application.routes.draw do

  devise_for :users

  root to: "home#index"
  match "/users/:id", to: "users#show", via: :get, as: "user"
  match '/pdf', to: "home#pdf", via: :get, as: "pdf"
  match '/about', to: "home#about", via: :get, as: "about"
  match "/search", to: "tutorials#search", via: :post, as: "search"

  get '/topics', to: "topics#index", as: "topics"
  get '/topics/:id', to: "topics#show", as: "topic"
  get '/subtopics', to: "subtopics#index", as: "subtopics"
  get '/subtopics/:id', to: "subtopics#show", as: "subtopic"
  post '/tutorials/:tutorial_id/generate_chapter', to: "chapters#generate", as: "generate_chapter"
  post '/chapters/update_sub_chapters', to: "chapters#update_sub_chapters", as: "update_subchapters"
  post '/contents/update_order', to: "contents#update_order", as: "update_orde"
  resources :communities do
    member do
      post :create_user_membership
      post :delete_user_membership
    end
  end

  resources :tutorials do
    member do
      get :pdf_view
      get :html_view
      patch :add_community
    end

    resources :chapters, shallow: true do 
      resources :sub_chapters do
        resources :paragraphs 
        resources :images
        resources :code_snippets
      end
    end
  end


  match "/users/ajax/sign_in", to: "users#sign_in", via: :get
  match "/users/ajax/sign_up", to: "users#sign_up", via: :get
  match "/up/:content_id/up", to: "contents#up", via: :get, as: "content_up"
  match "/down/:content_id/down", to: "contents#down", via: :get, as: "content_down"

  match "/ratings/:tutorial_id/:rating", to: "ratings#update_rating", via: :get, as: "update_rating"
  match "/ratings/update/:id", to: "ratings#update_rating_ajax", via: :post


  get "/contents/:content_id/comments", to: "comments#index", as: "content_comments"
  get "/contents/:content_id/comments/new", to: "comments#new", as: "new_comment"
  post "/contents/:content_id/comments", to: "comments#create", as: "create_comment"
  delete "/comment/:id", to: "comments#destroy", as: "delete_comment"
end
