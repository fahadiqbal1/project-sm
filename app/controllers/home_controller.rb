# Root Controller for the application
class HomeController < ApplicationController
    skip_before_filter :authenticate_user!

    def index
        # 
    end
end
