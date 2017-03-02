# Controller for the Static Pages
class StaticpageController < ApplicationController
  skip_before_action :authenticate_user!
  def ethos
    add_breadcrumb "Ethos", ethos_path
  end

  def contribute
    add_breadcrumb "Contribute", contribute_path
  end

  def privacy
    add_breadcrumb "Privacy Policy", privacy_path
  end
end
