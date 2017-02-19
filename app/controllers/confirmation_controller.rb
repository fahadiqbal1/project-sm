# Confirmation Controller - Handles the confirmation of users
class ConfirmationController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @user = User.new
  end

  # rubocop:disable Metrics/AbcSize
  def create
    params = params[:confirmation]
    user = User.find_by(:phone_number => params[:phone_number],
                        :phone_dial_code => params[:phone_dial_code])
    if user.present?
      if user.confirm_user(params[:confirmation][:otp])
        sign_in(user, :scope => :user)
        redirect_to root_path
      else
        redirect_back(:fallback_location => root_path)
      end
    else
      flash[:alert] = I18n.t "confirmation.phone_not_found"
      redirect_back(:fallback_location => root_path)
    end
  end
end
