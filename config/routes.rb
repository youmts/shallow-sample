Rails.application.routes.draw do
  namespace :user do
    resources :blogs, shallow: true do
      resources :entries, except: %i(index) do
        resources :comments, only: %i(create destroy)
      end
    end
  end
end
