Rails.application.routes.draw do
  resources :blogs do
    resources :entries, except: %i(index)
  end
end
