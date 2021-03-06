class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  before_filter :create_user
  before_filter :set_version

  def permition_to_write?(user)
    return true if user.role != User::ROLE_NORMA
    false
  end

  def create_user
    if session["warden.user.user.key"] != nil
      @user = User.find(session["warden.user.user.key"][1].first)
    else
      @user = User.new
      # @user.role = User::ROLE_NORMA
    end
  end

  def get_personnage(id)
    begin
      per = Personnage.find(id)
    rescue ActiveRecord::RecordNotFound => e
      per = nil
    end
    per
  end

  def set_version
    @version = VersionComment.last_version.first
  end
end
