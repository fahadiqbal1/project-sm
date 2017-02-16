class ConfirmationController < ApplicationController
  skip_before_action :authenticate_user!
  
  def index
    @user = User.new
  end

  def create
    user = User.find_by_phone_number(params[:confirmation][:phone_number])
    if user.present?
      if user.otp_confirmed_at
        flash[:alert] = I18n.t 'confirmation.already_confirmed'
        redirect_back(fallback_location: root_path)
      else 
        if params[:confirmation][:otp].eql? user.otp
          # Update user's otp_confirmed_at
          user.update( :otp_confirmed_at => Time.now )
          flash[:notice] = I18n.t 'confirmation.code_confirmed'
          redirect_to root_path
        else
          flash[:alert] = I18n.t 'confirmation.code_not_correct'
          redirect_back(fallback_location: root_path)
        end
      end
    else
      flash[:alert] = I18n.t 'confirmation.phone_not_found'
      redirect_back(fallback_location: root_path)
    end
  end
end
