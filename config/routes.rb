Rails.application.routes.draw do
  namespace :admin do
    resources :swapcard_autonomies

    root to: "swapcard_autonomies#index"
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
