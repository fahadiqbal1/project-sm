# Controller for the Static Pages
class StaticpageController < ApplicationController
  skip_before_action :authenticate_user!
  def ethos
  end

  def contribute
  end

  def privacy
  end
end
