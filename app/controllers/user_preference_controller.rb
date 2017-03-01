# User Preference Controller
class UserPreferenceController < ApplicationController
  def index
    @user = current_user
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      flash[:notice] = "Profile was successfully updated."
      redirect_to(:action => "index")
    else
      render :action => "index"
    end
  end

  private

  def user_params
    params.require(:user).permit(:phone_number, :phone_dial_code, :email,
                                 :user_preference_attributes => [
                                   :delivery_time,
                                   :consent,
                                   :first_name,
                                   :last_name,
                                   :gender,
                                   :country_of_origin,
                                   :country_of_residence
                                 ],
                                 :course_ids => [])
  end
end
