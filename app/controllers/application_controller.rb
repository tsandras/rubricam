class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!

  def permition_to_write?(user)
    return true if user.role != 0
    false
  end
end
