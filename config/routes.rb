Rails.application.routes.draw do
  devise_for :admins
  scope "(:locale)", :locale => /#{I18n.available_locales.join("|")}/ do
    devise_for :users, :controllers => {
      :sessions => "user/sessions"
    }, :path_names => {
      :sign_in => "login",
      :sign_out => "logout",
      :password => "secret",
      :unlock => "unblock",
      :registration => "_",
      :sign_up => "sign_up"
    }

    root "home#index"

    resources :confirmation, :only => [:index, :create]
    resources :user_preference, :only => [:index, :update], :path => "profile"

    get "/ethos" => "staticpage#ethos"
    get "/contribute" => "staticpage#contribute"
  end
end
