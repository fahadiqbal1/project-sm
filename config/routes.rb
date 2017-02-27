Rails.application.routes.draw do
  scope "(:locale)", :locale => /#{I18n.available_locales.join("|")}/ do
    devise_for :admins, :path_names => {
      :sign_in => "login"
    }
    devise_for :users, :controllers => {
      :sessions => "user/sessions"
    }, :path => "", :path_names => {
      :sign_in => "login",
      :sign_out => "logout",
      :password => "secret",
      :unlock => "unblock",
      :registration => "register",
      :sign_up => ""
    }, :skip => [:unlock, :confirmations]

    root "home#index"

    resources :confirmation, :only => [:index, :create]
    resources :user_preference, :only => [:index, :update], :path => "profile"

    get "/ethos" => "staticpage#ethos"
    get "/contribute" => "staticpage#contribute"
    get "/privacy" => "staticpage#privacy"
  end
end
