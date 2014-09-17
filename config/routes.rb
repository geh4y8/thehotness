Rails.application.routes.draw do
  get 'headshot_photos/new'

  post "headshot/capture" => 'headshot#capture', :as => :headshot_capture
  resources :photos, :only => [:index, :show, :new, :create, :edit] do
    post 'upload', :on => :collection
  end

  root to: "photos#new"
end
