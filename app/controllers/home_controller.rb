# Root Controller for the application
class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @disable_page_header = true
    @disable_breadcrumbs = true
  end
end
