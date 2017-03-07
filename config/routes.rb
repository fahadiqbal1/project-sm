Rails.application.routes.draw do
  resources :user_lesson_progressions
  require "sidekiq/web"

  scope "(:locale)", :locale => /#{I18n.available_locales.join("|")}/ do
    devise_for :admins, :path_names => {
      :sign_in => "login"
    }
    devise_for :users, :controllers => {
      :sessions => "user/sessions",
      :registrations => "user/registrations"
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
    resources :courses do
      resources :subjects, :only => [:show, :new, :edit, :update, :destroy] do
        resources :lessons, :only => [:show, :new, :edit, :update, :destroy] do
          resources :lesson_translations, :except => [:index], :path => "translation"
        end
      end
    end
    resources :admin, :only => [:index, :edit, :update, :destroy]

    get "/ethos" => "staticpage#ethos"
    get "/contribute" => "staticpage#contribute"
    get "/privacy" => "staticpage#privacy"

    authenticate :admin do
      mount Sidekiq::Web => "/sidekiq"
    end
  end
end
