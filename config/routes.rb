Rails.application.routes.draw do
  
  root 'static_pages#home'
  get 'about'   => 'static_pages#about'
  get 'signup'  => 'users#new'

end
