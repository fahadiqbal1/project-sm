# User Preference Controller
class UserPreferenceController < ApplicationController
  def index
    @user_preference = UserPreference.find_by(:user_id => current_user.id)
    @user = current_user
  end

  def update
  end
end
