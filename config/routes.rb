Rails.application.routes.draw do
  scope "(:locale)", :locale => /#{I18n.available_locales.join("|")}/ do
    devise_for :users, :controllers => {
      :sessions => "user/sessions"
    }

    root "home#index"

    resources :confirmation, :only => [:index, :create]
    resources :user_preference, :only => [:index, :update], :path => "profile"

    get "/ethos" => "staticpage#ethos"
    get "/contribute" => "staticpage#contribute"
  end
end
