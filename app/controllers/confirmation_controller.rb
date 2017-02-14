class ConfirmationController < ApplicationController
  skip_before_filter :authenticate_user!
  
  def index
  end

  def create
  end
end
