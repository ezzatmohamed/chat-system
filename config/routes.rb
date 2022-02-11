Rails.application.routes.draw do
  resources :applications, :except => [:destroy]
  resources :chats, :except => [:destroy], path: "applications/:token/chats"
end
