# Administator Controller
class AdminController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :authenticate_admin!

  def index
    @admin = Admin.all
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def update
    @admin = Admin.find(params[:id])

    if @admin.update_attributes(admin_params)
      flash[:notice] = "Administrator was successfully updated."
      redirect_to(:action => "index")
    else
      render :action => "edit"
    end
  end

  def destroy
    @admin = Admin.find(params[:id])
    @admin.destroy
    @admin.save
    flash[:notice] = "Administrator was successfully removed."
    redirect_to(:action => "index")
  end

  private

  def admin_params
    params.require(:admin).permit(
      :email,
      :translator,
      :approver,
      :superuser,
      :admin
    )
  end
end
