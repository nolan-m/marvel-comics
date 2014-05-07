ComicTracker::Application.routes.draw do
  root :to => 'application#index'
  resources :comics, :except => [:new, :edit]
end
