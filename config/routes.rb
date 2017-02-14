Rails.application.routes.draw do
  
  

  scope "(:locale)" do
    devise_for :users, controllers: {
      sessions: 'user/sessions'
    }
    root 'home#index'
  end

end
