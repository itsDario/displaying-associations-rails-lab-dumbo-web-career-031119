Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :artists, only: %i[index new show create update delete]
  resources :songs, only: %i[index new show create update delete]
end
