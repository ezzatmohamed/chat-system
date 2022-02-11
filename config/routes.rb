Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :applications, :except => [:destroy]
      resources :chats, :except => [:destroy], path: "applications/:token/chats"
      resources :messages, :except => [:destroy], path: "applications/:token/chats/:chat_number/messages"
    end
  end
end
