# User Preference Controller
class UserPreferenceController < ApplicationController
  def index
    @user = current_user
  end

  def update
  end
end
