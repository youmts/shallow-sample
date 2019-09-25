Rails.application.routes.draw do
  resources :blogs do
    resources :entries, except: %i(index) do
      resources :comments, only: %i(create destroy)
    end
  end
end
