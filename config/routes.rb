Rails.application.routes.draw do
  resources :blogs, shallow: true do
    resources :entries, except: %i(index) do
      resources :comments, only: %i(create destroy)
    end
  end
end
