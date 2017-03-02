# Confirmation Controller - Handles the confirmation of users
class ConfirmationController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    add_breadcrumb t("confirmation.index.title"), confirmation_index_path
    @user = User.new
  end

  # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
  def create
    confirm_params = params[:confirmation]
    user = User.find_by(:phone_number => confirm_params[:phone_number],
                        :phone_dial_code => confirm_params[:phone_dial_code])
    if user.present?
      if user.otp_confirmed?
        flash[:alert] = I18n.t "confirmation.already_confirmed"
        redirect_back(:fallback_location => root_path)
      elsif user.otp.eql? confirm_params[:otp]
        user.confirm_user
        flash[:notice] = I18n.t "confirmation.code_confirmed"
        sign_in(user, :scope => :user)
        redirect_to user_preference_index_path
      else
        flash[:alert] = I18n.t "confirmation.code_not_correct"
        redirect_back(:fallback_location => root_path)
      end
    else
      flash[:alert] = I18n.t "confirmation.phone_not_found"
      redirect_back(:fallback_location => root_path)
    end
  end
  # rubocop:enable Metrics/AbcSize, Metrics/MethodLength
end
