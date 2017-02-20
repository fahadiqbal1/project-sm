# User Preference Controller
class UserPreferenceController < ApplicationController
  def index
    @user_preference = UserPreference.find_by(:user_id => current_user.id)
  end

  def update
  end
end
