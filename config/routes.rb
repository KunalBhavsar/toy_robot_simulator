Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'toy#index'

  get 'index', :to => 'toy#index'
  patch 'init_place', :to => 'toy#init_place', :as => :init_place
  post 'place', :to => 'toy#place', :as => :place_toy
  patch 'move', :to => 'toy#move', :as => :move_toy
  patch 'turn_left', :to => 'toy#turn_left'
  patch 'turn_right', :to => 'toy#turn_right'
  patch 'reset', :to => 'toy#reset'
end
